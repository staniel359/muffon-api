module LastFM
  module Tag
    class Artists < LastFM::Tag::Base
      API_METHOD = 'tag.getTopArtists'.freeze
      COLLECTION_NAME = 'artists'.freeze
      MODEL_NAME = 'artist'.freeze

      include LastFM::Tag::Utils::Pagination

      private

      def tag
        response_data[
          "top#{collection_name}"
        ]
      end

      def collection_item_data_formatted(artist)
        LastFM::Tag::Artists::Artist.call(
          artist:,
          profile_id: @args[:profile_id],
          token: @args[:token],
          minimal: @args[:minimal]
        )
      end
    end
  end
end
