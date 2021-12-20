module Muffon
  module Processor
    module Profile
      module Playlist
        class Creator < Muffon::Processor::Profile::Playlist::Base
          private

          def primary_args
            super + [
              @args[:title]
            ]
          end

          def process_playlist
            playlist

            return playlist.errors_data if
                playlist.errors?

            process_image

            { playlist_id: playlist.id }
          end

          def playlist
            @playlist ||=
              profile.playlists.where(
                title: @args[:title]
              ).create
          end
        end
      end
    end
  end
end
