class Dashboard < ApplicationRecord

  def index
    @level_of_interest = Job.level_of_interest
  end
end
