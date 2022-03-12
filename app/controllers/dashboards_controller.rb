class DashboardsController < ApplicationController
  def overview
    authorize List
    authorize Sign
    # raise
  end
end
