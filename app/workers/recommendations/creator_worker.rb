module Recommendations
  class CreatorWorker
    include Sidekiq::Worker

    def perform(args)
      Muffon::Profile::Recommendations::Creator.call(
        args.deep_symbolize_keys
      )
    end
  end
end
