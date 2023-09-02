module Muffon
  module Worker
    module Profile
      module Recommendations
        module Artists
          class Base < Muffon::Worker::Profile::Recommendations::Base
            private

            def primary_args
              super + [
                @args[:library_artist_id]
              ]
            end

            def queue
              "profile_recommendation_artists_#{@args[:profile_id]}"
            end

            def worker_args
              @args.slice(
                *%i[
                  profile_id library_artist_id
                ]
              ).to_json
            end
          end
        end
      end
    end
  end
end
