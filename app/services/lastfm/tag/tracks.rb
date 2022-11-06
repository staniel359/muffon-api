module LastFM
  module Tag
    class Tracks < LastFM::Tag::Web::Base
      COLLECTION_NAME = 'tracks'.freeze

      include LastFM::Tag::Utils::Pagination

      private

      def tracks_list
        return random_track if @args[:random]

        raw_tracks_list
      end

      def random_track
        [raw_random_track].compact
      end

      def raw_random_track
        raw_tracks_list.to_a.sample
      end

      def raw_tracks_list
        response_data.css(
          '.chartlist-row'
        )
      end

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
