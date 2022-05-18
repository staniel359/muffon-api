module Muffon
  module Sendable
    class Video < Muffon::Base
      def call
        data
      end

      private

      def data
        {
          source: video[:source],
          title: video[:title],
          image: video[:image]
        }.compact
      end

      def video
        @args[:video].deep_symbolize_keys
      end
    end
  end
end
