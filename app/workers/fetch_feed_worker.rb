class FetchFeedWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'fetch_feed', retry: false

  def perform(channel_id)
    Channel.find(channel_id).fetch_items
  end
end
