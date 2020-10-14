module LastFM
  module Top
    class Tags < LastFM::Top::Base
      private

      def service_info
        {
          api_method: 'chart.getTopTags',
          response_data_node: 'tags'
        }
      end

      def top_data
        { tags: tags }
      end

      def tags
        response_data['tag'].map { |t| t['name'] }
      end
    end
  end
end
