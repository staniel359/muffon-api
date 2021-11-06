module YandexMusic
  module Search
    class Artists < YandexMusic::Search::Base
      COLLECTION_TYPE = 'artist'.freeze
      COLLECTION_NAME = 'artists'.freeze

      private

      def collection_item_data_formatted(artist)
        YandexMusic::Search::Artists::Artist.call(
          artist: artist,
          profile_id: @args.profile_id
        )
      end
    end
  end
end
