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
              id: library_artist.id,
              name: artist.name,
              image: artist.image_data,
              tracks_count:
                library_artist.library_tracks_count,
              albums_count:
                library_artist.library_albums_count
            }.compact
          end

          def library_artist
            @args[:library_artist]
          end

          def artist
            @artist ||= library_artist.artist
          end
        end
      end
    end
  end
end
