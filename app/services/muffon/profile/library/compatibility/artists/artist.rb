module Muffon
  module Profile
    module Library
      module Compatibility
        class Artists
          class Artist < Muffon::Profile::Library::Compatibility::Artists
            include Muffon::Utils::Library::Artist

            def call
              data
            end

            private

            def data
              {
                id: library_artist.id,
                name: artist.name,
                image: artist.image_data
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
end
