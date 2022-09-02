module Muffon
  module Profile
    module Playlist
      class Base < Muffon::Profile::Base
        def call
          return forbidden if no_rights?

          super
        end

        private

        def no_rights?
          playlist.private &&
            wrong_profile?
        end

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
            profile.playlists.find_by(
              id: @args[:playlist_id]
            )
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
