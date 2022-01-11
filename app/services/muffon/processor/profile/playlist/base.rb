module Muffon
  module Processor
    module Profile
      module Playlist
        class Base < Muffon::Profile::Base
          private

          def primary_args
            [
              @args[:profile_id],
              @args[:token]
            ]
          end

          def no_data?
            playlist.blank?
          end

          def playlist
            @playlist ||=
              profile.playlists.find_by(
                id: @args[:playlist_id]
              )
          end

          def data
            return forbidden if wrong_profile?

            process_playlist
          end

          def process_image
            playlist.process_image(
              @args[:image]
            )
          end
        end
      end
    end
  end
end
