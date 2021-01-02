module SoundCloud
  module Search
    class Albums < SoundCloud::Search::Base
      private

      def link
        "#{search_link}/albums"
      end

      def limit
        (@args.limit || 20).to_i
      end

      def search_data
        { albums: albums_data }
      end

      def albums_data
        response_data['collection'].map do |a|
          {
            title: a['title'],
            artist: a.dig('user', 'username'),
            soundcloud_id: a['id']
          }
        end
      end
    end
  end
end
