namespace :feed do
  task add_fetch_jobs: :environment do
    Channel.all.each { |channel| Delayed::Job.enqueue FetchFeedJob.new(channel.id) }
  end

  task start_workers: :environment do
    Delayed::Job.delete_all
    3.times do
      Delayed::Worker.new(min_priority: ENV['MIN_PRIORITY'], 
        max_priority: ENV['MAX_PRIORITY']).start
    end
  end

  task clear_jobs: :environment do
    Delayed::Job.delete_all
  end
end
