module LastFM
  module Tag
    class Artists < LastFM::Tag::Web::Base
      COLLECTION_NAME = 'artists'.freeze

      include LastFM::Tag::Utils::Pagination

      private

      def artists_list
        return random_artist if @args[:random]

        raw_artists_list
      end

      def random_artist
        [raw_random_artist].compact
      end

      def raw_random_artist
        raw_artists_list.to_a.sample
      end

      def raw_artists_list
        response_data.css(
          '.big-artist-list-item'
        )
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
