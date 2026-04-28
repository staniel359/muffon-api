module Discogs
  module Album
    class Tags < Discogs::Album::Info
      private

      def album_data
        Muffon::Formatter::Source::Album::Tags.call(
          tags:
        )
      end
    end
  end
end
