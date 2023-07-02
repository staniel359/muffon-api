module Muffon
  module Radio
    class Base < Muffon::Base
      include Muffon::Utils::Track

      private

      def no_data?
        radio_track_data.blank?
      end

      def random_track_number
        return 1 if test?

        rand(
          1..tracks_limit
        )
      end

      def tracks_limit
        self.class::TRACKS_LIMIT
      end

      def random_artist_number
        return 1 if test?

        rand(
          1..artists_limit
        )
      end

      def artists_limit
        self.class::ARTISTS_LIMIT
      end

      def data
        { radio: radio_data }
      end

      def radio_data
        { track: track_data }
      end

      def track_data
        {
          player_id:,
          source: source_data,
          title:,
          artist: artists_base_data,
          artists:
        }
      end

      def player_id
        radio_track_data[:player_id]
      end

      def source_data
        radio_track_data[:source]
      end

      def title
        radio_track_data[:title]
      end

      def artists
        [artist_data]
      end

      def artist_data
        { name: artist_name }
      end
    end
  end
end
