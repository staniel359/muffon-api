module Muffon
  module Sendable
    class Album < Muffon::Base
      include Muffon::Mixins::Album

      def call
        check_args

        data
      end

      private

      def required_args
        %i[
          raw_album_data
        ]
      end

      def data
        {
          source: album_data[:source],
          title:,
          artist: album_data[:artist],
          artists: album_data[:artists],
          image: album_data[:image],
          listeners_count: album_record.listeners_count,
          release_date: album_data[:release_date]
        }.compact
      end

      def title
        album_data[:title]
      end

      def album_data
        @args[:raw_album_data].deep_symbolize_keys
      end

      def artist_name
        album_data.dig(
          :artist,
          :name
        )
      end
    end
  end
end
