class Profile
  module Recommendation
    module Track
      class CreatorWorker < Worker::Base
        def perform(args)
          Muffon::Processor::Profile::Recommendation::Track::Creator.call(
            args_formatted(args)
          )
        end
      end
    end
  end
end
