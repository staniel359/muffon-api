module SoundCloud
  module Search
    class Base < SoundCloud::API::V2::Base
      include Muffon::Utils::Pagination

      private

      def primary_args
        [@args[:query]]
      end

      def no_data?
        collection_list.blank?
      end

      def collection_list
        @collection_list ||=
          response_data['collection']
      end

      def link
        "#{BASE_LINK}/search/#{collection_name}"
      end

      def params
        super.merge(search_params)
      end

      def search_params
        {
          q: @args[:query],
          limit:,
          offset:
        }
      end

      def data
        { search: paginated_data }
      end

      def total_items_count
        response_data['total_results']
      end
    end
  end
end
