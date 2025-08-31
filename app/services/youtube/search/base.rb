module YouTube
  module Search
    class Base < YouTube::Base
      include YouTube::Utils::Pagination

      def call
        check_args

        data
      end

      private

      def required_args
        if @args[:video_id].present?
          %i[
            video_id
          ]
        elsif @args[:query].present?
          %i[
            query
          ]
        else
          %i[
            query
            video_id
          ]
        end
      end

      def link
        "#{BASE_LINK}/search"
      end

      def params
        {
          **super,
          q: @args[:query],
          type: model_name,
          part: 'snippet',
          maxResults: limit,
          pageToken: @args[:page]
        }.compact
      end

      def model_name
        self.class::MODEL_NAME
      end

      def data
        { search: paginated_data }
      end

      def collection_list
        response_data['items']
      end

      def channel_item?(
        collection_item
      )
        collection_item['id'].is_a?(Hash) &&
          collection_item.dig('id', 'kind') == 'youtube#channel'
      end
    end
  end
end
