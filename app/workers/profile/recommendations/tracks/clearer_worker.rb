class Profile
  module Recommendations
    module Tracks
      class ClearerWorker < Worker::Base
        def perform(args)
          Muffon::Processor::Profile::Recommendations::Tracks::Clearer.call(
            args_formatted(args)
          )
        end
      end
    end
  end
end
