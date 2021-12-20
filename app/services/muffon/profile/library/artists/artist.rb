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
              id: profile_artist.id,
              favorite_id: favorite_id,
              name: artist.name,
              image: artist.image_data,
              albums_count:
                profile_artist.profile_albums_count,
              tracks_count:
                profile_artist.profile_tracks_count
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
