module Discogs
  module Album
    class Tags < Discogs::Album::Info
      private

      def album_data
        Muffon::Formatter::Album::Tags.call(
          tags:
        )
      end
    end
  end
end
