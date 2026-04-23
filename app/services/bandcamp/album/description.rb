module Bandcamp
  module Album
    class Description < Bandcamp::Album::Info
      private

      def album_data
        Muffon::Formatter::Album::Description.call(
          description:
        )
      end
    end
  end
end
