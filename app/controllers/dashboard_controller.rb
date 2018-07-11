class DashboardController < ApplicationController

  def index
    @level_of_interest = Job.level_of_interest
  end
end
