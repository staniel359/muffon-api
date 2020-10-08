module LastFM
  module Top
    class Tags < LastFM::Top::Base
      private

      def parsed_response
        @parsed_response ||= JSON.parse(
          api_response('chart.getTopTags')
        )['tags']
      end

      def top_data
        { tags: tags, page: page }
      end

      def tags
        parsed_response['tag'].map { |t| t['name'] }
      end
    end
  end
end
