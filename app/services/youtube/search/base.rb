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

      def data
        { search: search_data }
      end

      def raw_collection
        response_data['items']
      end

      def link
        "#{BASE_LINK}/search"
      end

      def params
        {
          **super,
          q: @args[:query],
          part: 'snippet',
          maxResults: limit,
          pageToken: @args[:page]
        }.compact
      end

      def channel_item?(
        raw_item_data
      )
        raw_item_data['id'].is_a?(Hash) &&
          raw_item_data.dig('id', 'kind') == 'youtube#channel'
      end
    end
  end
end
