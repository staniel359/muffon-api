class Profile
  module Recommendations
    module Tracks
      class CreatorWorker < Worker::Base
        def perform(args)
          Muffon::Processor::Profile::Recommendations::Tracks::Creator.call(
            args_formatted(args)
          )
        end
      end
    end
  end
end
