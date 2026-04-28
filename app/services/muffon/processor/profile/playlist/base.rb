module Muffon
  module Processor
    module Profile
      module Playlist
        class Base < Muffon::Processor::Profile::Base
          private

          def playlist_record
            if defined?(@playlist)
              @playlist
            else
              @playlist =
                profile_record
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
