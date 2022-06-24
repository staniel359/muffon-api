module LastFM
  module Tag
    class Albums < LastFM::Tag::Kerve::Base
      COLLECTION_NAME = 'albums'.freeze
      MODEL_NAME = 'album'.freeze
      TOTAL_LIMIT = 1_000

      private

      def collection_item_data_formatted(album)
        LastFM::Tag::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id]
        )
      end
    end
  end
end
