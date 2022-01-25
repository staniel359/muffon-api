module Muffon
  module Processor
    module Profile
      module Playlist
        class Updater < Muffon::Processor::Profile::Playlist::Base
          private

          def primary_args
            super + [
              @args[:playlist_id],
              @args[:title]
            ]
          end

          def process_playlist
            update_playlist

            return playlist.errors_data if
                playlist.errors?

            process_image

            { profile: profile_data }
          end

          def update_playlist
            playlist.update(
              title: @args[:title]
            )
          end

          def profile_data
            {
              nickname:,
              playlist: playlist_data
            }
          end

          def playlist_data
            Muffon::Profile::Playlists::Playlist.call(
              playlist:
            )
          end
        end
      end
    end
  end
end
