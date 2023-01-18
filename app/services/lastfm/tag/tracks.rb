module LastFM
  module Tag
    class Tracks < LastFM::Tag::Base
      API_METHOD = 'tag.getTopTracks'.freeze
      COLLECTION_NAME = 'tracks'.freeze
      MODEL_NAME = 'track'.freeze

      include LastFM::Tag::Utils::Pagination

      private

      def collection_item_data_formatted(track)
        LastFM::Tag::Tracks::Track.call(
          track:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
