module VK
  module Search
    class Base < VK::Web
      private

      def primary_args
        [@args.query]
      end

      def no_data?
        super || results.blank?
      end

      def params
        {
          act: 'load_catalog_section',
          al: 1,
          owner_id: secrets.vk[:page_id],
          section_id: section_id,
          start_from: @args.next_page
        }
      end

      def section_id
        VK::Search::Results.call(query: @args.query).dig(
          :search, :results, collection_name.to_sym
        )
      end

      def results
        @results ||= response_data.dig(1, 1)
      end

      def data
        { search: search_data }
      end

      def search_data
        {
          next_page: results['next_from'],
          collection_name.to_sym => collection_data
        }
      end
    end
  end
end
