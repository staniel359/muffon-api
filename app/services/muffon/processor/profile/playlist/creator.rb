module Muffon
  module Processor
    module Profile
      module Playlist
        class Creator < Muffon::Processor::Profile::Playlist::Base
          private

          def required_args
            super + %i[
              title
            ]
          end

          def process_playlist
            playlist

            if playlist.errors?
              playlist.errors_data
            else
              process_image

              { playlist: playlist_data }
            end
          end

          def playlist
            @playlist ||=
              profile
              .playlists
              .create(
                create_args
              )
          end

          def create_args
            {
              title: @args[:title],
              description: @args[:description],
              private: @args[:private]
            }
          end

          def playlist_data
            { id: playlist.id }
          end
        end
      end
    end
  end
end
