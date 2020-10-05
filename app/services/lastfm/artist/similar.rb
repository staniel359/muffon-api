module LastFM
  module Artist
    class Similar < LastFM::Base
      def call
        return not_found_data if parsed_response.blank?

        { artist: similar_data }
      end

      private

      def parsed_response
        @parsed_response ||= JSON.parse(
          api_response('artist.getSimilar')
        )['similarartists']
      end

      def similar_data
        {
          name: parsed_response['@attr']['artist'],
          similar: similar
        }
      end

      def similar
        parsed_response['artist'].map do |a|
          {
            name: a['name'],
            mbid: a['mbid']
          }
        end
      end
    end
  end
end
