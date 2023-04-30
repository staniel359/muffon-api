module Discogs
  module Album
    class Links < Discogs::Album::Info
      private

      def album_data
        { links: source_links }
      end
    end
  end
end
