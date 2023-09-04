module Muffon
  module Worker
    module Profile
      module Recommendations
        module Tracks
          class Base < Muffon::Worker::Profile::Recommendations::Base
            private

            def primary_args
              super + [
                @args[:library_track_id]
              ]
            end

            def queue
              "profile_recommendation_tracks_#{@args[:profile_id]}"
            end

            def worker_args
              @args.slice(
                *%i[
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
