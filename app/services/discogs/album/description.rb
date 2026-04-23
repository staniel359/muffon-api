module Discogs
  module Album
    class Description < Discogs::Album::Info
      private

      def album_data
        Muffon::Formatter::Album::Description.call(
          description:
        )
      end
    end
  end
end
