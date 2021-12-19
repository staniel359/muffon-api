module LastFM
  module Tag
    class Tracks < LastFM::Tag::Web::Base
      COLLECTION_NAME = 'tracks'.freeze
      include LastFM::Tag::Utils::Pagination

      private

      def tracks_list
        return sample_track if @args[:sample]

        raw_trackslist
      end

      def sample_track
        [raw_sample_track].compact
      end

      def raw_sample_track
        raw_trackslist.to_a.sample
      end

      def raw_trackslist
        @raw_trackslist ||=
          response_data.css(
            '.chartlist-row'
          )
      end

      def collection_item_data_formatted(track)
        LastFM::Tag::Tracks::Track.call(
          track: track,
          profile_id: @args[:profile_id]
        )
      end
    end
  end
end
