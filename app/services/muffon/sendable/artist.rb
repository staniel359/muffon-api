module Muffon
  module Sendable
    class Artist < Muffon::Base
      include Muffon::Utils::Artist

      def call
        check_args

        data
      end

      private

      def required_args
        %i[
          artist
        ]
      end

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
        super.slice(
          :small
        )
      end
    end
  end
end
