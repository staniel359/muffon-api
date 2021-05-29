module VK
  module Search
    class Base < VK::Base
      include Muffon::Utils::Pagination

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
          owner_id: vk_owner_id,
          section_id: section_id,
          start_from: @args.next_page
        }
      end

      def section_id
        sections[collection_name.to_sym]
      end

      def sections
        VK::Search::Sections.call(
          query: @args.query
        ).dig(:search, :sections)
      end

      def results
        @results ||= response_data.dig(1, 1)
      end

      def data
        { search: search_data }
      end

      def page
        nil
      end

      def next_page
        results['next_from']
      end
    end
  end
end
