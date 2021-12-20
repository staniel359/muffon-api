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
                id: profile_artist.id,
                name: artist.name,
                image: artist.image_data
              }.compact
            end

            def profile_artist
              @args[:profile_artist]
            end
          end
        end
      end
    end
  end
end
