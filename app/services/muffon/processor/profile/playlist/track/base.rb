module Muffon
  module Processor
    module Profile
      module Playlist
        module Track
          class Base < Muffon::Profile::Playlist::Base
            private

            def primary_args
              [
                @args[:profile_id],
                @args[:token]
              ]
            end

            def data
              return forbidden if wrong_profile?

              process_playlist_track
            end
          end
        end
      end
    end
  end
end
