module Muffon
  module Processor
    module Profile
      module Playlist
        module Track
          class Base < Muffon::Processor::Profile::Playlist::Base
            private

            def playlist_data
              { tracks_count: }
            end

            def tracks_count
              playlist_record.tracks_count
            end
          end
        end
      end
    end
  end
end
