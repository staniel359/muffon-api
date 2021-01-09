module Discogs
  module Group
    class Albums < Discogs::Base
      private

      def primary_args
        [@args.group_id]
      end

      def data
        { group: group_data }
      end

      def group_data
        {
          page: page,
          total_pages: total_pages,
          albums: albums
        }
      end

      def page
        response_data.dig('pagination', 'page')
      end

      def link
        "#{base_link}/masters/#{@args.group_id}/versions"
      end

      def total_pages
        response_data.dig('pagination', 'pages')
      end

      def extra_params
        { page: @args.page, per_page: @args.limit }
      end

      def albums
        response_data['versions'].map do |a|
          {
            title: a['title'],
            image: a['thumb'],
            released: a['released'],
            format: a['format'],
            discogs_id: a['id']
          }
        end
      end
    end
  end
end
