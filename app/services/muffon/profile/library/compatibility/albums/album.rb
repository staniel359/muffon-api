module Muffon
  module Profile
    module Library
      module Compatibility
        class Albums
          class Album < Muffon::Profile::Library::Compatibility::Albums
            include Muffon::Utils::Library::Album

            def call
              data
            end

            private

            def data
              {
                library: library_album_data,
                title:,
                artist: artist_names_data,
                artists:,
                image: library_album.image_data
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
