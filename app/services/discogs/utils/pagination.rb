module Discogs
  module Utils
    module Pagination
      include Muffon::Utils::Pagination

      private

      def params
        super.merge(
          pagination_params
        )
      end

      def pagination_params
        {
          page:,
          per_page: limit
        }
      end
    end
  end
end
