module MusixMatch
  module Album
    class Tracks < MusixMatch::Album::Base
      MODEL_NAME = 'track'.freeze
      COLLECTION_NAME = 'tracks'.freeze
      PAGE_LIMIT = 200

      include MusixMatch::Utils::Pagination

      private

      def not_found?
        false
      end

      def link
        "#{BASE_LINK}/album.tracks.get"
      end

      def collection_item_data_formatted(track)
        MusixMatch::Album::Tracks::Track.call(
          track:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end

      alias album_data paginated_data
    end
  end
end
