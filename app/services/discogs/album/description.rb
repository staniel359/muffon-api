module Discogs
  module Album
    class Description < Discogs::Album::Info
      private

      def album_data
        Muffon::Formatter::Source::Album::Description.call(
          description:
        )
      end
    end
  end
end
