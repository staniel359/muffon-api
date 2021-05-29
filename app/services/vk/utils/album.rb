module VK
  module Utils
    module Album
      private

      def title
        CGI.unescapeHTML(album['title'])
      end

      def extra_title
        CGI.unescapeHTML(
          album['subTitle'] || ''
        ).presence
      end

      def vk_id
        album['id']
      end

      def vk_owner_id
        album['ownerId']
      end

      def vk_access_hash
        album['accessHash']
      end

      def artists
        [artist_data_formatted(album)]
      end

      def image_data
        image_data_formatted(
          album['coverUrl'], 'album'
        )
      end
    end
  end
end
