module Muffon
  module Worker
    module Profile
      module Recommendations
        module Tracks
          class Creator <
              Muffon::Worker::Profile::Recommendations::Tracks::Base
            private

            def process_recommendations
              ::Profile::Recommendations::Tracks::CreatorWorker.set(
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
