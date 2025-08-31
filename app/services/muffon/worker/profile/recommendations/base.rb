module Muffon
  module Worker
    module Profile
      module Recommendations
        class Base < Muffon::Worker::Base
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              profile_id
            ]
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
