module Muffon
  module Profile
    module Library
      module Compatibility
        class Tracks
          class Track < Muffon::Profile::Library::Compatibility::Tracks
            include Muffon::Utils::Library::Track

            def call
              data
            end

            private

            def data
              {
                id: library_track.id,
                title: track.title,
                artist: artist_data,
                image: library_album&.image_data
              }.compact
            end

            def library_track
              @args[:library_track]
            end
          end
        end
      end
    end
  end
end
