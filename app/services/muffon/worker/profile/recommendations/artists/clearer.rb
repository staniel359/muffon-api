module Muffon
  module Worker
    module Profile
      module Recommendations
        module Artists
          class Clearer <
              Muffon::Worker::Profile::Recommendations::Artists::Base
            private

            def process_recommendations
              ::Profile::Recommendations::Artists::ClearerWorker.set(
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
end
