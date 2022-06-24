module LastFM
  module Tag
    class Artists < LastFM::Tag::Kerve::Base
      COLLECTION_NAME = 'artists'.freeze
      MODEL_NAME = 'artist'.freeze
      TOTAL_LIMIT = 1_000

      private

      def collection_list
        return random_item if @args[:random]

        super
      end

      def collection_item_data_formatted(artist)
        LastFM::Tag::Artists::Artist.call(
          artist:,
          profile_id: @args[:profile_id],
          minimal: @args[:minimal]
        )
      end
    end
  end
end
