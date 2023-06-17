module LastFM
  module Connection
    class Destroyer < LastFM::Connection::Base
      private

      def process_profile
        profile
          .lastfm_connection
          &.destroy

        { success: true }
      end
    end
  end
end
