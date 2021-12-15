module LastFM
  module Utils
    module Pagination
      TOTAL_LIMIT = 200
      include Muffon::Utils::Pagination

      private

      def params
        super.merge(
          pagination_params
        )
      end

      def pagination_params
        { limit: total_limit }
      end

      def total_limit
        TOTAL_LIMIT
      end
    end
  end
end
