module AmazonMusic
  module Album
    class Links < AmazonMusic::Album::Info
      private

      def album_data
        { links: source_links }
      end
    end
  end
end
