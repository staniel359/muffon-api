module Muffon
  module Sendable
    class VideoPlaylist < Muffon::Base
      def call
        data
      end

      private

      def data
        {
          source: playlist[:source],
          title: playlist[:title],
          channel: playlist[:channel],
          description: playlist[:description],
          image: playlist[:image],
          videos_count: playlist[:videos_count]
        }.compact
      end

      def playlist
        @args[:playlist].deep_symbolize_keys
      end
    end
  end
end
