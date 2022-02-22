// // signup/app/javascript/components/record_sign.js

import Rails from "@rails/ujs";

const recordSign = () => {
  // console.log(start)
  const start = document.getElementById("start");
  if(start) {
  const stop = document.getElementById("stop");
  const live = document.getElementById("live");
  const form = document.querySelector("form");
  const stopVideo = () => {
    live.srcObject.getTracks().forEach(track => track.stop());
  }

  // stop.addEventListener("click", stopVideo);

  const stopRecording = () => {
    return new Promise(resolve => stop.addEventListener("click", resolve));
  }

  const startRecording = (stream) => {
    const recorder = new MediaRecorder(stream);
    let data = [];

    recorder.ondataavailable = event => data.push(event.data);
    recorder.start();

    const stopped = new Promise((resolve, reject) => {
      recorder.onstop = resolve;
      recorder.onerror = event => reject(event.name);
    });

    const recorded = stopRecording().then(
      () => {
        stopVideo();
        recorder.state == "recording" && recorder.stop();
      }
    );

    return Promise.all([
      stopped,
      recorded
    ])
    .then(() => data);
  }

  const uploadToCloudinary  = (video) => {
    const formData = new FormData(form);
    formData.append('video[video]', video, 'my_video.mp4');
    console.log(formData, video)

    Rails.ajax({
      url: "/signs",
      type: "post",
      data: formData
    })
  }

  start.addEventListener("click", (e) => {
    e.preventDefault();
    navigator.mediaDevices.getUserMedia({
      audio: true,
      video: true
    })
    .then(stream => {
      live.srcObject = stream;
      live.captureStream = live.captureStream || live.mozCaptureStream;
      return new Promise(resolve => live.onplaying = resolve);
    })
    .then(() => startRecording(live.captureStream()))
    .then (recordedChunks => {

      const recordedBlob = new Blob(recordedChunks, { type: "video/mp4" });
      uploadToCloudinary(recordedBlob);
    })
  });
 }
}

export { recordSign };
