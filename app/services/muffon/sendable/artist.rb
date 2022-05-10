module Muffon
  module Sendable
    class Artist < Muffon::Base
      include Muffon::Utils::Artist

      def call
        data
      end

      private

      def data
        {
          name:,
          image: image_data,
          listeners_count:
        }.compact
      end

      def name
        artist[:name]
      end

      def artist
        @args[:artist].deep_symbolize_keys
      end

      def image_data
        super&.slice(
          :extrasmall
        )
      end
    end
  end
end
