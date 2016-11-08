class FleaMarketJob < ApplicationJob
  queue_as :default

  def perform(flea)
    flea.increment! :view_count
  end
end
