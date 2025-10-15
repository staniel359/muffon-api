module YouTubeMusic
  module Search
    class Albums < YouTubeMusic::Search::Base
      COLLECTION_NAME = 'albums'.freeze
      SCOPE = 'albums'.freeze

      private

      def collection_item_data_formatted(
        raw_album_data
      )
        YouTubeMusic::Search::Albums::Album.call(
          raw_album_data:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
