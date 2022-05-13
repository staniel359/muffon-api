module Muffon
  module Sendable
    class Track < Muffon::Base
      def call
        data
      end

      private

      def data
        {
          source: track[:source],
          title: track[:title],
          player_id: track[:player_id],
          artist: track[:artist],
          artists: track[:artists],
          album: track[:album],
          image: track[:image],
          audio: track[:audio]
        }.compact
      end

      def track
        @args[:track].deep_symbolize_keys
      end
    end
  end
end
