module AmazonMusic
  module Album
    class Links < AmazonMusic::Album::Info
      private

      def album_data
        { links: source_links_data }
      end
    end
  end
end
