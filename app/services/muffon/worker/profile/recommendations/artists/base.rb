module Muffon
  module Worker
    module Profile
      module Recommendations
        module Artists
          class Base < Muffon::Worker::Profile::Recommendations::Base
            private

            def required_args
              super + %i[
                library_artist_id
              ]
            end

            def queue
              "profile_recommendation_artists_#{@args[:profile_id]}"
            end

            def worker_args
              {
                profile_id: @args[:profile_id],
                library_artist_id: @args[:library_artist_id]
              }
            end
          end
        end
      end
    end
  end
end
