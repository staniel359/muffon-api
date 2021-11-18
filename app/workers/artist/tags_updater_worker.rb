class Artist
  class TagsUpdaterWorker
    include Sidekiq::Worker

    def perform(args)
      Muffon::Updater::Artist::Tags.call(
        args.deep_symbolize_keys
      )
    end
  end
end
