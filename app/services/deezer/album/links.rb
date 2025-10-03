module Deezer
  module Album
    class Links < Deezer::Album::Info
      private

      def album_data
        { links: source_links_data }
      end
    end
  end
end
