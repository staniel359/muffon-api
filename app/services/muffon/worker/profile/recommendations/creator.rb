module Muffon
  module Worker
    module Profile
      module Recommendations
        class Creator < Muffon::Worker::Profile::Recommendations::Base
          private

          def process_recommendations
            ::Profile::Recommendations::CreatorWorker.set(
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
