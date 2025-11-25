module YouTube
  module Utils
    module Pagination
      private

      def previous_page
        response_data['prevPageToken']
      end

      def next_page
        response_data['nextPageToken']
      end
    end
  end
end
