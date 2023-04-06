module YouTube
  module Video
    class Related < YouTube::Video::Base
      COLLECTION_NAME = 'related'.freeze
      TOTAL_LIMIT = 80

      include Muffon::Utils::Pagination

      private

      def search_data
        @search_data ||=
          YouTube::Search::Videos.call(
            video_id: @args[:video_id],
            profile_id: @args[:profile_id],
            token: @args[:token],
            limit: total_limit
          )[:search] || {}
      end

      def video_data
        video_base_data
          .merge(paginated_data)
      end

      def collection_count
        raw_collection.size
      end

      def raw_collection
        search_data[:videos] || []
      end

      def collection
        collection_paginated(
          raw_collection
        )
      end
    end
  end
end
