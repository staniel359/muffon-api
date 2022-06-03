class Profile
  module Recommendation
    class CreatorWorker < Worker::Base
      def perform(args)
        Muffon::Processor::Profile::Recommendation::Creator.call(
          args_formatted(args)
        )
      end
    end
  end
end
