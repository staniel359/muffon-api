module Muffon
  module Sendable
    class VideoChannel < Muffon::Base
      def call
        data
      end

      private

      def data
        {
          source: channel[:source],
          title: channel[:title],
          image: channel[:image],
          statistics: channel[:statistics]
        }.compact
      end

      def channel
        @args[:channel].deep_symbolize_keys
      end
    end
  end
end
