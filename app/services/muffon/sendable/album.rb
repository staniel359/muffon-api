module Muffon
  module Sendable
    class Album < Muffon::Base
      include Muffon::Utils::Album

      def call
        check_args

        data
      end

      private

      def required_args
        %i[
          album
        ]
      end

      def data
        {
          source: album[:source],
          title:,
          artist: album[:artist],
          artists: album[:artists],
          image: album[:image],
          listeners_count:,
          release_date: album[:release_date]
        }.compact
      end

      def title
        album[:title]
      end

      def album
        @args[:album].deep_symbolize_keys
      end

      def artist_name
        album.dig(
          :artist,
          :name
        )
      end
    end
  end
end
