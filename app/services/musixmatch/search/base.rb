module MusixMatch
  module Search
    class Base < MusixMatch::Base
      include MusixMatch::Utils::Pagination

      private

      def primary_args
        [@args[:query]]
      end

      def link
        "#{BASE_LINK}/#{model_name}.search"
      end

      def params
        super.merge(
          search_params
        )
      end

      def search_params
        { q: @args[:query] }
      end

      def data
        { search: paginated_data }
      end
    end
  end
end
