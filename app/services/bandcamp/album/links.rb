module Bandcamp
  module Album
    class Links < Bandcamp::Album::Info
      private

      def album_data
        { links: source_links }
      end
    end
  end
end
