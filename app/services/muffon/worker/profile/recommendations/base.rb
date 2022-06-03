module Muffon
  module Worker
    module Profile
      module Recommendations
        class Base < Muffon::Base
          private

          def primary_args
            [
              @args[:profile_id],
              @args[:library_artist_id]
            ]
          end

          def data
            limit_queue

            process_recommendations
          end

          def limit_queue
            Sidekiq::Queue[queue].limit = 1
          end

          def queue
            "profile_recommendations_#{@args[:profile_id]}"
          end

          def worker_args
            @args.slice(
              *%i[profile_id library_artist_id]
            ).to_json
          end
        end
      end
    end
  end
end
