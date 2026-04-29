module Muffon
  module Profile
    module Playlist
      class Info < Muffon::Profile::Playlist::Base
        private

        def playlist_data
          Muffon::Formatter::Playlist::Info.call(
            playlist_record:
          )
        end

        def playlist_record
          if defined?(@playlist_record)
            @playlist_record
          else
            @playlist_record =
              profile_record
              .playlists
              .associated
              .find_by(
                id: @args[:playlist_id]
              )
          end
        end
      end
    end
  end
end
