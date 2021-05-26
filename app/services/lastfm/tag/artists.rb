module LastFM
  module Tag
    class Artists < LastFM::Tag::Web::Base
      COLLECTION_NAME = 'artists'.freeze

      private

      def artists_list
        response_data.css(
          '.big-artist-list-item'
        )
      end

      def collection_item_data_formatted(artist)
        LastFM::Tag::Artists::Artist.call(
          artist: artist
        )
      end
    end
  end
end
