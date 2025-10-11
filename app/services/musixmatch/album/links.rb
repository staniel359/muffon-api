module MusixMatch
  module Album
    class Links < MusixMatch::Album::Info
      private

      def album_data
        { links: source_links_data }
      end
    end
  end
end
