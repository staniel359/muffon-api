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
              self_data
                .merge(album_data)
            end

            def album_data
              {
                source: source_data,
                library: library_album_data,
                title:,
                image: library_album.image_data,
                tracks_count:,
                created: created_formatted
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
