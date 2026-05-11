module LastFM
  module Connection
    class Destroyer < LastFM::Connection::Base
      private

      def process_profile
        profile_record
          .lastfm_connection
          &.destroy

        { success: true }
      end
    end
  end
end
