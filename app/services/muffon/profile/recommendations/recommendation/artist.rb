module Muffon
  module Profile
    class Recommendations
      class Recommendation
        class Artist < Muffon::Profile::Recommendations::Recommendation
          def call
            data
          end

          private

          def data
            {
              id: id,
              name: name,
              image: image_data,
              tracks_count: tracks_count,
              albums_count: albums_count
            }.compact
          end

          def id
            profile_artist.id
          end

          def profile_artist
            @profile_artist ||= @args.artist
          end

          def name
            profile_artist
              .artist
              .name
          end

          def image_data
            profile_artist
              .artist
              .image_data
          end

          def tracks_count
            profile_artist.profile_tracks_count
          end

          def albums_count
            profile_artist.profile_albums_count
          end
        end
      end
    end
  end
end