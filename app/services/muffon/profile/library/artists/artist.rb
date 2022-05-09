module Muffon
  module Profile
    module Library
      class Artists
        class Artist < Muffon::Profile::Library::Artists
          include Muffon::Utils::Library::Artist

          def call
            data
          end

          private

          def data
            {
              library: library_artist_data,
              favorite_id:,
              name:,
              image: artist.image_data,
              albums_count:
                library_artist.library_albums_count,
              tracks_count:
                library_artist.library_tracks_count
            }.compact
          end

          def library_artist
            @args[:library_artist]
          end
        end
      end
    end
  end
end
