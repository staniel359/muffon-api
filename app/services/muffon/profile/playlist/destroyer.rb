module Muffon
  module Profile
    module Playlist
      class Destroyer < Muffon::Profile::Playlist::Base
        private

        def primary_args
          [
            @args[:profile_id],
            @args[:token],
            @args[:playlist_id]
          ]
        end

        def data
          return forbidden if wrong_profile?

          playlist&.destroy

          { success: true }
        end
      end
    end
  end
end
