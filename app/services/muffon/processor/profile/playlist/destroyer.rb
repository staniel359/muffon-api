module Muffon
  module Processor
    module Profile
      module Playlist
        class Destroyer < Muffon::Processor::Profile::Playlist::Base
          private

          def required_args
            [
              *super,
              :playlist_id
            ]
          end

          def data
            playlist_record.destroy!

            { success: true }
          end
        end
      end
    end
  end
end
