module VK
  module Album
    class Links < VK::Album::Info
      private

      def album_data
        { links: source_links }
      end
    end
  end
end
