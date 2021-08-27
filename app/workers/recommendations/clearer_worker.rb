module Recommendations
  class ClearerWorker
    include Sidekiq::Worker

    def perform(args)
      Muffon::Profile::Recommendations::Clearer.call(
        args
      )
    end
  end
end
