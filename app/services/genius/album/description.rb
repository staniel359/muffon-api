module Genius
  module Album
    class Description < Genius::Album::Info
      private

      def album_data
        Muffon::Formatter::Album::Description.call(
          description:
        )
      end
    end
  end
end
