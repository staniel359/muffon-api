module SoundCloud
  module Search
    class Albums < SoundCloud::Search::Base
      private

      def link
        "#{base_link}/playlists"
      end

      def limit
        100
      end

      def search_data
        { albums: albums_data }
      end

      def albums_data
        playlists_filtered.first(results_limit).map do |a|
          {
            title: a['title'],
            artist: a.dig('user', 'username'),
            images: images(a, 'album'),
            soundcloud_id: a['id']
          }
        end
      end

      def playlists_filtered
        response_data.select { |p| p['playlist_type'].present? }
      end

      def results_limit
        (@args.limit || 20).to_i
      end
    end
  end
end
