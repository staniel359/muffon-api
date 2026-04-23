module Bandcamp
  module Album
    class Tags < Bandcamp::Album::Info
      private

      def album_data
        Muffon::Formatter::Album::Tags.call(
          tags:
        )
      end
    end
  end
end
