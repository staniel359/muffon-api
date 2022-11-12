module Muffon
  module Sendable
    class Album < Muffon::Base
      include Muffon::Utils::Album

      def call
        data
      end

      private

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
          :artist, :name
        )
      end
    end
  end
end
