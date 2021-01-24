module SoundCloud
  module Search
    class Albums < SoundCloud::Search::Base
      private

      def soundcloud_collection_name
        'playlists'
      end

      def collection_name
        'albums'
      end

      def total_limit
        100
      end

      def collection_list
        playlists_filtered.first(limit)
      end

      def playlists_filtered
        response_data.select { |p| p['playlist_type'].present? }
      end

      def limit
        (@args.limit || 20).to_i
      end

      def collection_item_data(album)
        {
          title: album['title'],
          artist: artist_data(album),
          images: images_data(album, 'album'),
          soundcloud_id: album['id']
        }
      end
    end
  end
end
