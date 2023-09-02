module Muffon
  module Worker
    module Profile
      module Recommendations
        module Artists
          class Creator <
              Muffon::Worker::Profile::Recommendations::Artists::Base
            private

            def process_recommendations
              ::Profile::Recommendations::Artists::CreatorWorker.set(
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
