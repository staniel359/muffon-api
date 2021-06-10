module YouTube
  module Utils
    module Pagination
      include Muffon::Utils::Pagination

      private

      def next_page
        response_data['nextPageToken']
      end
    end
  end
end
