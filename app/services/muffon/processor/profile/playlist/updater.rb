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

          def no_data?
            super || playlist.blank?
          end

          def playlist
            @playlist ||=
              profile
              .playlists
              .find_by(
                id: @args[:playlist_id]
              )
          end

          def process_playlist
            update_playlist

            return playlist.errors_data if
                playlist.errors?

            process_image

            { playlist: playlist_data }
          end

          def update_playlist
            playlist.update(
              update_args
            )
          end

          def update_args
            {
              title: @args[:title],
              description: @args[:description],
              private: @args[:private]
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
