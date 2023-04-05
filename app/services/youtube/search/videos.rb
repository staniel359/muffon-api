module YouTube
  module Search
    class Videos < YouTube::Search::Base
      MODEL_NAME = 'video'.freeze
      COLLECTION_NAME = 'videos'.freeze

      private

      def collection_item_data_formatted(video)
        YouTube::Search::Videos::Video.call(
          video:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
