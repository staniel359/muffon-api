module LastFM
  module Tag
    class Tracks < LastFM::Tag::Web::Base
      COLLECTION_NAME = 'tracks'.freeze
      include LastFM::Tag::Utils::Pagination

      private

      def tracks_list
        return sample_track if @args[:sample]

        raw_tracks_list
      end

      def sample_track
        [raw_sample_track].compact
      end

      def raw_sample_track
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
          profile_id: @args[:profile_id]
        )
      end
    end
  end
end
