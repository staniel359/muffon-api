module LastFM
  module Search
    class Tags < LastFM::Search::Base
      private

      def search_data
        paginated_data(
          collection_name: 'tags',
          raw_collection:
            raw_collection_filtered,
          page:,
          limit:,
          pages_count:
        )
      end

      def response_data
        @response_data ||=
          Google::Search.call(
            params
          ).try(
            :[],
            :search
          ) || {}
      end

      def params
        {
          query: @args[:query],
          scope: 'lastfm_tags',
          page: @args[:page]
        }
      end

      def page
        response_data[:page]
      end

      def pages_count
        response_data[:total_pages]
      end

      def raw_collection_filtered
        raw_collection.reject do |item_data|
          item_data[:title].blank?
        end
      end

      def raw_collection
        response_data[:results] || []
      end

      def collection_item_data_formatted(tag)
        LastFM::Search::Tags::Tag.call(
          tag:
        )
      end
    end
  end
end
