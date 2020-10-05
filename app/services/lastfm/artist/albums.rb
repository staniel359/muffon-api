module LastFM
  module Artist
    class Albums < LastFM::Base
      def call
        return not_found_data if parsed_response.blank?

        { artist: albums_data }
      end

      private

      def parsed_response
        @parsed_response ||= JSON.parse(
          api_response('artist.getTopAlbums')
        )['topalbums']
      end

      def albums_data
        {
          name: parsed_response['@attr']['artist'],
          albums: albums,
          page: parsed_response['@attr']['page'].to_i
        }
      end

      def albums
        parsed_response['album'].map do |a|
          {
            title: a['name'],
            cover: a['image'].last['#text'].sub('/300x300', ''),
            mbid: a['mbid'] || '',
            plays_count: a['playcount'].to_i
          }
        end
      end
    end
  end
end
