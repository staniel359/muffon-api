module Muffon
  module Profile
    module Playlist
      class Updater < Muffon::Profile::Playlist::Base
        private

        def primary_args
          super + [
            @args[:playlist_id],
            @args[:title]
          ]
        end

        def data
          return forbidden if wrong_profile?

          playlist.update(
            update_params
          )

          return errors_data if errors?

          process_image

          { profile: profile_data }
        end

        def update_params
          @args.permit!.slice(
            :title
          )
        end

        def playlist_data
          Muffon::Profile::Playlists::Playlist.call(
            playlist: playlist
          )
        end
      end
    end
  end
end
