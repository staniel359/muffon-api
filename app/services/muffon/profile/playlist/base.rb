module Muffon
  module Profile
    module Playlist
      class Base < Muffon::Profile::Base
        private

        def required_args
          [
            *super,
            :token,
            :playlist_id
          ]
        end

        def not_found?
          super || playlist_record.blank?
        end

        def playlist_record
          if defined?(@playlist_record)
            @playlist_record
          else
            @playlist_record =
              profile_record
              .playlists
              .find_by(
                id: @args[:playlist_id]
              )
          end
        end

        def forbidden?
          if profile_record.private || playlist_record.private
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
