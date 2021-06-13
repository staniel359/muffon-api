module LastFM
  module Tag
    class Tracks < LastFM::Tag::Web::Base
      COLLECTION_NAME = 'tracks'.freeze
      include LastFM::Tag::Utils::Pagination

      private

      def tracks_list
        response_data.css('.chartlist-row')
      end

      def collection_item_data_formatted(track)
        LastFM::Tag::Tracks::Track.call(
          track: track
        )
      end
    end
  end
end
