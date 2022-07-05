module YandexMusic
  module Search
    class Albums < YandexMusic::Search::Base
      COLLECTION_TYPE = 'album'.freeze
      COLLECTION_NAME = 'albums'.freeze
      TOTAL_LIMIT = 200

      private

      def collection_item_data_formatted(album)
        YandexMusic::Search::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id]
        )
      end
    end
  end
end
