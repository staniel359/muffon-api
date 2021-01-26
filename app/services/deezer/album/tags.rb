module Deezer
  module Album
    class Tags < Deezer::Album::Base
      private

      def album_data
        {
          title: response_data['title'],
          artist: album_artist_data,
          tags: tags
        }
      end

      def album_artist_data
        { name: response_data.dig('artist', 'name') }
      end

      def tags
        tags_list.map { |g| g['name'] }
      end

      def tags_list
        response_data.dig('genres', 'data')
      end
    end
  end
end
