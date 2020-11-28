module LastFM
  module Artist
    class SimilarList < LastFM::API
      private

      def service_info
        {
          api_method: 'artist.getSimilar',
          response_data_node: 'similarartists'
        }
      end

      def primary_args
        [@args.artist]
      end

      def limit
        250
      end

      def data
        { artist: similar_data }
      end

      def similar_data
        {
          name: response_data.dig('@attr', 'artist'),
          page: page,
          total_pages: limit.fdiv(page_limit).ceil,
          similar: similar
        }
      end

      def similar
        similar_paginated.map { |a| a['name'] }
      end

      def similar_paginated
        response_data['artist'][offset, page_limit] || []
      end

      def offset
        (page - 1) * page_limit
      end

      def page_limit
        @args.limit.to_i.in?(1..limit) ? @args.limit.to_i : limit
      end

      def page
        (@args.page || 1).to_i
      end
    end
  end
end
