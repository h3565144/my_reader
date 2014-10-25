namespace :feed do
  task add_fetch_jobs: :environment do
    Channel.all.each { |channel| FetchFeedWorker.perform_async channel.id }
  end

  task :clear_jobs do
    require 'sidekiq/api'
    Sidekiq::Queue.new('fetch_feeds').clear
  end
end
