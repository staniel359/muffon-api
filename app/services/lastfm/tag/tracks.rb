module LastFM
  module Tag
    class Tracks < LastFM::Tag::Kerve::Base
      COLLECTION_NAME = 'tracks'.freeze
      MODEL_NAME = 'track'.freeze
      TOTAL_LIMIT = 2_500

      private

      def collection_list
        return random_item if @args[:random]

        super
      end

      def collection_item_data_formatted(track)
        LastFM::Tag::Tracks::Track.call(
          track:,
          profile_id: @args[:profile_id]
        )
      end
    end
  end
end
