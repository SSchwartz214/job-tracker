class DashboardController < ApplicationController

  def index
    @level_of_interest = Job.level_of_interest
    @top_three = Job.top_three
    @jobs_by_location = Job.jobs_by_location
  end
end
