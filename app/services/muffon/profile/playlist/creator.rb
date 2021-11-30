module Muffon
  module Profile
    module Playlist
      class Creator < Muffon::Profile::Playlist::Base
        private

        def primary_args
          [
            @args[:profile_id],
            @args[:token],
            @args[:title]
          ]
        end

        def data
          return forbidden if wrong_profile?

          playlist

          return errors_data if errors?

          process_image

          { playlist_id: playlist.id }
        end

        def playlist
          @playlist ||= profile.playlists.where(
            title: @args[:title]
          ).create
        end
      end
    end
  end
end
