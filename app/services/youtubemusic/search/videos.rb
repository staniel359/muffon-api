module YouTubeMusic
  module Search
    class Videos < YouTubeMusic::Search::Base
      COLLECTION_NAME = 'videos'.freeze
      SCOPE = 'videos'.freeze

      private

      def collection_item_data_formatted(video)
        YouTubeMusic::Search::Videos::Video.call(
          video:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
