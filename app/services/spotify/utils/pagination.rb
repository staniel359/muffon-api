module Spotify
  module Utils
    module Pagination
      include Muffon::Utils::Pagination

      private

      def params
        super.merge(pagination_params)
      end

      def pagination_params
        {
          limit:,
          offset:
        }
      end
    end
  end
end
