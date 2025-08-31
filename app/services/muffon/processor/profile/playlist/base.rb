module Muffon
  module Processor
    module Profile
      module Playlist
        class Base < Muffon::Processor::Profile::Base
          private

          def data
            process_playlist
          end

          def process_image
            playlist.process_image(
              @args[:image]
            )
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
                  id: @args[:playlist_id]
                )
            end
          end
        end
      end
    end
  end
end
