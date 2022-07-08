module YouTube
  module Channel
    class Base < YouTube::Base
      private

      def primary_args
        [@args[:channel_id]]
      end

      def channel
        items_list[0]
      end

      def link
        "#{BASE_LINK}/channels"
      end

      def params
        super.merge(
          channel_params
        )
      end

      def channel_params
        {
          id: @args[:channel_id],
          part: 'snippet,contentDetails,statistics'
        }
      end

      def data
        { channel: channel_data }
      end

      def channel_base_data
        { title: }
      end

      def title
        CGI.unescapeHTML(
          snippet['title']
        )
      end

      def snippet
        channel['snippet']
      end
    end
  end
end
