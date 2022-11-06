module Muffon
  module Profile
    module Library
      class Albums
        class Album < Muffon::Profile::Library::Albums
          include Muffon::Utils::Library::Album

          def call
            data
          end

          private

          def data
            self_data
              .merge(album_base_data)
              .merge(album_extra_data)
          end

          def album_base_data
            {
              library: library_album_data,
              title:,
              artist: artist_names_data,
              artists:
            }.compact
          end

          def library_album
            @args[:library_album]
          end

          def album_extra_data
            {
              image: library_album.image_data,
              tracks_count:
                library_album.library_tracks_count,
              created: created_formatted
            }.compact
          end
        end
      end
    end
  end
end
