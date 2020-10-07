module LastFM
  module Search
    class Albums < LastFM::Search::Base
      private

      def model_name
        'album'
      end

      def albums
        parsed_response.dig('albummatches', 'album').map do |a|
          {
            title: a['name'],
            artist: a['artist'],
            cover: a['image'].last['#text'].sub('/300x300', '')
          }
        end
      end
    end
  end
end
