module YouTube
  module Search
    class Base < YouTube::Base
      include YouTube::Utils::Pagination

      private

      def primary_args
        [
          @args[:query] ||
            @args[:video_id]
        ]
      end

      def link
        "#{BASE_LINK}/search"
      end

      def params
        super.merge(
          search_params
        )
      end

      def search_params
        {
          q: @args[:query],
          type: model_name,
          part: 'snippet',
          maxResults: limit,
          pageToken: @args[:page],
          relatedToVideoId:
            @args[:video_id]
        }.compact
      end

      def model_name
        self.class::MODEL_NAME
      end

      def data
        { search: search_data }
      end

      def search_data
        {
          prev_page:,
          next_page:,
          collection_name.to_sym =>
            collection.compact
        }.compact
      end

      def collection_list
        response_data['items']
      end
    end
  end
end
