module Muffon
  module Worker
    module Profile
      module Recommendations
        class Clearer < Muffon::Worker::Profile::Recommendations::Base
          private

          def process_recommendations
            ::Profile::Recommendations::ClearerWorker.set(
              queue:
            ).perform_async(
              worker_args
            )
          end
        end
      end
    end
  end
end
