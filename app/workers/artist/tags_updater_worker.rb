class Artist
  class TagsUpdaterWorker
    include Sidekiq::Worker
    include Sidekiq::Throttled::Worker

    sidekiq_options queue: :artist_tags_updater

    sidekiq_throttle(
      concurrency: {
        limit: 1
      }
    )

    def perform(args)
      Muffon::Updater::Artist::Tags.call(
        args.deep_symbolize_keys
      )
    end
  end
end
