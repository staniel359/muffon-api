module Muffon
  module Sendable
    class Track < Muffon::Base
      def call
        check_args

        data
      end

      private

      def required_args
        %i[
          raw_track_data
        ]
      end

      def data
        {
          source: track_data[:source],
          title: track_data[:title],
          player_id: track_data[:player_id],
          artist: track_data[:artist],
          artists: track_data[:artists],
          album: track_data[:album],
          image: track_data[:image],
          audio: track_data[:audio]
        }.compact
      end

      def track_data
        @args[:raw_track_data].deep_symbolize_keys
      end
    end
  end
end
