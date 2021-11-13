class Artist
  class TagsUpdaterWorker
    include Sidekiq::Worker

    def perform(args)
      Muffon::Updater::Artist::Tags.call(
        args
      )
    end
  end
end
