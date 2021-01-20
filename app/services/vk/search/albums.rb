module VK
  module Search
    class Albums < VK::Search::Base
      private

      def collection_name
        'albums'
      end

      def collection_data
        albums_list.map { |a| album_data(a) }
      end

      def albums_list
        results['playlists']
      end

      def album_data(album)
        {
          title: album_title(album),
          artist: album_artist_name(album),
          images: images(album['coverUrl'], 'album'),
          vk_id: album['id'],
          vk_owner_id: album['ownerId'],
          vk_access_hash: album['accessHash']
        }
      end
    end
  end
end
