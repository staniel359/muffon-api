module YouTube
  module Search
    class Base < YouTube::Base
      include YouTube::Utils::Pagination

      private

      def primary_args
        [@args[:query]]
      end

      def link
        "#{BASE_LINK}/search"
      end

      def params
        super.merge(search_params)
      end

      def search_params
        {
          q: @args[:query],
          type: 'video',
          part: 'snippet',
          maxResults: limit,
          pageToken: @args[:page]
        }.compact
      end

      def data
        { search: search_data }
      end
    end
  end
end
