module Muffon
  module Worker
    module Profile
      module Recommendations
        class Base < Muffon::Base
          private

          def primary_args
            [@args[:profile_id]]
          end

          def data
            limit_queue

            process_recommendations
          end

          def limit_queue
            Sidekiq::Queue[queue].limit = 5
          end
        end
      end
    end
  end
end
