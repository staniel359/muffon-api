module Muffon
  module Sendable
    class Artist < Muffon::Base
      include Muffon::Mixins::Artist

      def call
        check_args

        data
      end

      private

      def required_args
        %i[
          raw_artist_data
        ]
      end

      def data
        {
          name:,
          image: image_data,
          listeners_count: artist_record.listeners_count
        }.compact
      end

      def name
        artist_data[:name]
      end

      def artist_data
        @args[:raw_artist_data].deep_symbolize_keys
      end

      def image_data
        artist_record
          .image_data
          &.slice(
            :small
          )
      end
    end
  end
end
