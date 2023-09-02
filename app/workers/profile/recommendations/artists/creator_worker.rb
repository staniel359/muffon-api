class Profile
  module Recommendations
    module Artists
      class CreatorWorker < Worker::Base
        def perform(args)
          Muffon::Processor::Profile::Recommendations::Artists::Creator.call(
            args_formatted(args)
          )
        end
      end
    end
  end
end
