class DashboardsController < ApplicationController
  def overview
    authorize List
    authorize Sign
  end
end
