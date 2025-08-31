module Muffon
  module Processor
    module Profile
      module Playlist
        module Track
          class Base < Muffon::Processor::Profile::Playlist::Base
            private

            def data
              process_playlist_track
            end

            def playlist_data
              {
                tracks_count:
                  playlist.tracks_count
              }
            end
          end
        end
      end
    end
  end
end
