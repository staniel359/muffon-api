module Muffon
  module Profile
    module Recommendation
      class Artists
        class Artist < Muffon::Profile::Recommendation::Artists
          include Muffon::Utils::Library::Artist

          def call
            data
          end

          private

          def data
            {
              library: library_artist_data,
              name:,
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
        end
      end
    end
  end
end
