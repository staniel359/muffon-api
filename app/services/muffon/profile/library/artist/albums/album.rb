module Muffon
  module Profile
    module Library
      module Artist
        class Albums
          class Album < Muffon::Profile::Library::Artist::Albums
            include Muffon::Utils::Library::Album

            def call
              data
            end

            private

            def data
              {
                library: library_album_data,
                favorite_id:,
                title:,
                image: library_album.image_data,
                tracks_count:
                  library_album.library_tracks_count
              }.compact
            end

            def library_album
              @args[:library_album]
            end
          end
        end
      end
    end
  end
end
