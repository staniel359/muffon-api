module Genius
  module Album
    class Links < Genius::Album::Info
      private

      def album_data
        { links: source_links }
      end
    end
  end
end
