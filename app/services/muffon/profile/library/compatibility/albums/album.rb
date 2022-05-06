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
                id: library_album.id,
                title: album.title,
                artist: artist_data,
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
