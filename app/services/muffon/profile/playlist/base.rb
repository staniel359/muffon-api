module Muffon
  module Profile
    module Playlist
      class Base < Muffon::Profile::Base
        private

        def primary_args
          [
            @args[:profile_id],
            @args[:playlist_id]
          ]
        end

        def no_data?
          super || playlist.blank?
        end

        def playlist
          @playlist ||=
            profile
            .playlists
            .find_by(
              id: playlist_id
            )
        end

        def playlist_id
          @args[:playlist_id]
        end

        def forbidden?
          return false if creator?

          playlist.private && !valid_profile?
        end

        def profile_data
          {
            nickname:,
            playlist: playlist_data
          }
        end
      end
    end
  end
end
