module Recommendations
  class CreatorWorker
    include Sidekiq::Worker

    def perform(args)
      Muffon::Profile::Recommendations::Creator.call(
        args
      )
    end
  end
end
