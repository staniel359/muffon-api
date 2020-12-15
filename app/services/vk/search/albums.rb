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
        { albums: albums }
      end

      def albums
        official_albums.map { |a| album_data(a) }
      end

      def official_albums
        results.select { |r| r['isOfficial'] }
      end

      def album_data(album)
        VK::Search::Albums::Album.call(album: album)
      end
    end
  end
end
