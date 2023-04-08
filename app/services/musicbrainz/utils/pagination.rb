module MusicBrainz
  module Utils
    module Pagination
      include Muffon::Utils::Pagination

      private

      def pagination_params
        {
          limit:,
          offset:
        }
      end
    end
  end
end
