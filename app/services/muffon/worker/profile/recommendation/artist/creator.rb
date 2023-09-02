module Muffon
  module Worker
    module Profile
      module Recommendation
        module Artist
          class Creator < Muffon::Worker::Profile::Recommendation::Base
            private

            def primary_args
              super + [
                @args[:artist_name],
                @args[:library_artist_id]
              ]
            end

            def queue
              "profile_recommendation_artist_#{@args[:profile_id]}"
            end

            def process_recommendation
              ::Profile::Recommendation::Artist::CreatorWorker.set(
                queue:
              ).perform_async(
                worker_args
              )
            end

            def worker_args
              @args.slice(
                *%i[
                  artist_name profile_id
                  library_artist_id
                ]
              ).to_json
            end
          end
        end
      end
    end
  end
end
