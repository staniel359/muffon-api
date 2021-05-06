module Spotify
  module Artist
    class Info < Spotify::Artist::Base
      private

      def no_data?
        response_data.blank?
      end

      def link
        base_link
      end

      def data
        { artist: artist_data }
      end

      def artist_data
        {
          name: response_data['name'],
          image: response_data.dig('images', 0, 'url'),
          genres: response_data['genres']
        }
      end
    end
  end
end
