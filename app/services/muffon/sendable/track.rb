module Muffon
  module Sendable
    class Track < Muffon::Base
      def call
        data
      end

      private

      def data
        {
          title: track[:title],
          player_id: track[:player_id],
          artist: track[:artist],
          artists: track[:artists],
          album: track[:album],
          image: track[:image]
        }.compact
      end

      def track
        @args[:track].deep_symbolize_keys
      end
    end
  end
end
