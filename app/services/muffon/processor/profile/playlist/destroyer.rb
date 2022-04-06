module Muffon
  module Processor
    module Profile
      module Playlist
        class Destroyer < Muffon::Processor::Profile::Playlist::Base
          private

          def primary_args
            super + [
              @args[:playlist_id]
            ]
          end

          def no_data?
            super || playlist.blank?
          end

          def playlist
            @playlist ||=
              profile.playlists.find_by(
                id: @args[:playlist_id]
              )
          end

          def process_playlist
            playlist&.destroy

            { success: true }
          end
        end
      end
    end
  end
end
