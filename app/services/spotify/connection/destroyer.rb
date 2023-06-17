module Spotify
  module Connection
    class Destroyer < Spotify::Connection::Base
      private

      def process_profile
        profile
          .spotify_connection
          &.destroy

        { success: true }
      end
    end
  end
end
