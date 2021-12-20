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
            {
              id: profile_album.id,
              favorite_id: favorite_id,
              title: album.title,
              artist: artist_data,
              image: profile_album.image_data,
              tracks_count:
                profile_album.profile_tracks_count
            }.compact
          end

          def profile_album
            @args[:profile_album]
          end
        end
      end
    end
  end
end
