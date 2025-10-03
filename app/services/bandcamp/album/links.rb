module Bandcamp
  module Album
    class Links < Bandcamp::Album::Info
      private

      def album_data
        { links: source_links_data }
      end
    end
  end
end
