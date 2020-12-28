module VK
  module Search
    class Albums < VK::Search::Base
      private

      def request_params
        {
          act: 'section',
          al: 1,
          owner_id: secrets.vk[:page_id],
          q: @args.query
        }
      end

      def results
        @results ||= response_data.dig(1, 1, 'playlists')
      end

      def search_data
        { albums: albums_data }
      end

      def albums_data
        albums_filtered.map { |a| album(a) }
      end

      def albums_filtered
        results.select { |r| matched_result?(r) }
      end

      def matched_result?(result)
        @args.tracks ? matched_tracks?(result) : matched_albums?(result)
      end

      def matched_tracks?(result)
        result['type'] == 'search'
      end

      def matched_albums?(result)
        result['type'] == 'playlist' && result['isOfficial'] == 1
      end

      def album(album)
        @args.tracks ? tracks_data(album) : album_data(album)
      end

      def tracks_data(album)
        { vk_id: album['id'] }
      end

      def album_data(album)
        {
          title: album_title(album),
          artist: album_artist_name(album),
          vk_id: album['id'],
          vk_owner_id: album['ownerId'],
          vk_access_hash: album['accessHash']
        }
      end
    end
  end
end
