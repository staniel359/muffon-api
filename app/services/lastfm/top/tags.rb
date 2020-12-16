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

      def collection_name
        'tags'
      end

      def limit
        1000
      end

      def page
        tags_paginated[:page]
      end

      def total_pages
        tags_paginated[:total_pages]
      end

      def collection
        tags_paginated[:collection].map do |t|
          {
            name: t['name'],
            taggers_count: t['reach'].to_i
          }
        end
      end

      def tags_paginated
        @tags_paginated ||= LastFM::Utils::Paginated.call(
          collection: response_data['tag'],
          page: @args.page,
          limit: @args.limit
        )
      end
    end
  end
end
