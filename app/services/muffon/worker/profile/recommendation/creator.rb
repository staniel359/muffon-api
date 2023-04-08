module Muffon
  module Worker
    module Profile
      module Recommendation
        class Creator < Muffon::Base
          private

          def primary_args
            [
              @args[:artist_name],
              @args[:profile_id],
              @args[:library_artist_id]
            ]
          end

          def data
            limit_queue

            process_recommendation
          end

          def limit_queue
            Sidekiq::Queue[queue].limit = 3
          end

          def queue
            "profile_recommendations_#{@args[:profile_id]}"
          end

          def process_recommendation
            ::Profile::Recommendation::CreatorWorker.set(
              queue:
            ).perform_async(
              worker_args
            )
          end

          def worker_args
            @args.slice(
              *%i[artist_name profile_id library_artist_id]
            ).to_json
          end
        end
      end
    end
  end
end
