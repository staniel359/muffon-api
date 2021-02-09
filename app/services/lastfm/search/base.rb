module LastFM
  module Search
    class Base < LastFM::API::Base
      include LastFM::API::Paginated

      private

      def service_info
        {
          api_method: "#{model_name}.search",
          response_data_node: 'results'
        }
      end

      def primary_args
        [@args.query]
      end

      def no_data?
        super || results.blank?
      end

      def results
        @results ||= response_data.dig(
          "#{model_name}matches", model_name
        )
      end

      def params
        super.merge(search_params).merge(pagination_params)
      end

      def search_params
        { model_name.to_sym => @args.query }
      end

      def data
        { search: search_data }
      end

      def search_data
        {
          page: page,
          total_pages: total_pages,
          collection_name.to_sym => collection_data
        }
      end

      def collection_list
        results
      end
    end
  end
end
