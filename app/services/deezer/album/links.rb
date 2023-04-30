module Deezer
  module Album
    class Links < Deezer::Album::Info
      private

      def album_data
        { links: source_links }
      end
    end
  end
end
