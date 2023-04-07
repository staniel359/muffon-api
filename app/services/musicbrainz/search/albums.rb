module MusicBrainz
  module Search
    class Albums < MusicBrainz::Search::Base
      COLLECTION_NAME = 'albums'.freeze
      MODEL_NAME = 'release'.freeze
      TOTAL_LIMIT = 200

      private

      def collection_item_data_formatted(album)
        MusicBrainz::Search::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
