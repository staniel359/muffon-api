module Muffon
  module Worker
    module Profile
      module Recommendation
        class Base < Muffon::Base
          private

          def primary_args
            [@args[:profile_id]]
          end

          def data
            limit_queue

            process_recommendation
          end

          def limit_queue
            Sidekiq::Queue[queue].limit = 1
          end
        end
      end
    end
  end
end
