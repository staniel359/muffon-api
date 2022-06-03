class Profile
  module Recommendations
    class ClearerWorker < Worker::Base
      def perform(args)
        Muffon::Processor::Profile::Recommendations::Clearer.call(
          args_formatted(args)
        )
      end
    end
  end
end
