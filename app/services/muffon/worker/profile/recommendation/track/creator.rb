module Muffon
  module Worker
    module Profile
      module Recommendation
        module Track
          class Creator < Muffon::Worker::Profile::Recommendation::Base
            private

            def primary_args
              super + [
                @args[:artist_name],
                @args[:track_title],
                @args[:library_track_id]
              ]
            end

            def queue
              "profile_recommendation_track_#{@args[:profile_id]}"
            end

            def process_recommendation
              ::Profile::Recommendation::Track::CreatorWorker.set(
                queue:
              ).perform_async(
                worker_args
              )
            end

            def worker_args
              @args.slice(
                *%i[
                  artist_name track_title
                  profile_id library_track_id
                ]
              ).to_json
            end
          end
        end
      end
    end
  end
end
