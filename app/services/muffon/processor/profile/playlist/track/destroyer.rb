module Muffon
  module Processor
    module Profile
      module Playlist
        module Track
          class Destroyer < Muffon::Processor::Profile::Playlist::Track::Base
            private

            def primary_args
              super + [
                @args[:playlist_track_id]
              ]
            end

            def process_playlist_track
              playlist_track&.destroy

              { playlist: playlist_data }
            end

            def playlist_track
              playlist.playlist_tracks.find_by(
                id: @args[:playlist_track_id]
              )
            end
          end
        end
      end
    end
  end
end
