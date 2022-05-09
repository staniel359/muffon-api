module Muffon
  module Sendable
    class Track < Muffon::Base
      def call
        data
      end

      private

      def data
        {
          title: track['title'],
          player_id: track['player_id'],
          artist: track['artist'],
          artists: track['artists'],
          album: track['album'],
          image: track['image']
        }
      end

      def track
        @args[:track]
      end
    end
  end
end
