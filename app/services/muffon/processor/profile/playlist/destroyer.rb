module Muffon
  module Processor
    module Profile
      module Playlist
        class Destroyer < Muffon::Processor::Profile::Playlist::Base
          private

          def required_args
            super + %i[
              playlist_id
            ]
          end

          def not_found?
            super ||
              playlist.blank?
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
