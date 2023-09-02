class Profile
  module Recommendation
    module Artist
      class CreatorWorker < Worker::Base
        def perform(args)
          Muffon::Processor::Profile::Recommendation::Artist::Creator.call(
            args_formatted(args)
          )
        end
      end
    end
  end
end
