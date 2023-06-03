module SoundCloud
  module Search
    class Albums < SoundCloud::Search::Base
      COLLECTION_NAME = 'albums'.freeze

      private

      def collection_item_data_formatted(album)
        SoundCloud::Search::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
