module Audius
  module Artist
    class Info < Audius::Artist::Base
      include Audius::Mixins::Artist

      private

      def artist_data
        {
          **super,
          albums_count:
        }
      end

      def raw_artist_data
        response_data.dig(
          'data',
          0
        )
      end

      def albums_count
        raw_artist_data['album_count']
      end
    end
  end
end
