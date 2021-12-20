module Muffon
  module Profile
    module Recommendation
      class Artists
        class Artist < Muffon::Profile::Recommendation::Artists
          def call
            data
          end

          private

          def data
            {
              id: profile_artist.id,
              name: artist.name,
              image: artist.image_data,
              tracks_count: profile_artist.profile_tracks_count,
              albums_count: profile_artist.profile_albums_count
            }.compact
          end

          def profile_artist
            @args[:profile_artist]
          end

          def artist
            @artist ||= profile_artist.artist
          end
        end
      end
    end
  end
end
