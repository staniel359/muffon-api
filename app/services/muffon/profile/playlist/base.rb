module Muffon
  module Profile
    module Playlist
      class Base < Muffon::Profile::Base
        private

        def required_args
          super + %i[
            playlist_id
          ]
        end

        def not_found?
          super ||
            playlist.blank?
        end

        def playlist
          if instance_variable_defined?(
            :@playlist
          )
            @playlist
          else
            @playlist =
              profile
              .playlists
              .find_by(
                id: playlist_id
              )
          end
        end

        def playlist_id
          @args[:playlist_id]
        end

        def forbidden?
          if profile.private || playlist.private
            if creator?
              false
            else
              !valid_profile?
            end
          else
            false
          end
        end

        def profile_data
          {
            **super,
            playlist: playlist_data
          }
        end
      end
    end
  end
end
