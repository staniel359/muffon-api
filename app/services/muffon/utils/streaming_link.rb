module Muffon
  module Utils
    class StreamingLink < Muffon::Base
      SOURCES = {
        bandcamp: 'b',
        deezer: 'd',
        soundcloud: 'sc',
        spotify: 's',
        yandexmusic: 'ya',
        youtubemusic: 'y',
        youtube: 'y'
      }.freeze

      def call
        return if not_all_args?

        data
      end

      private

      def primary_args
        [
          @args[:model],
          @args[:source],
          @args[:model_id]
        ]
      end

      def data
        return unless valid_link?

        "#{base_link}/#{source_prefix}/#{@args[:model_id]}"
      end

      def valid_link?
        [
          base_link,
          source_prefix
        ].all?(&:present?)
      end

      def base_link
        if album? || (bandcamp_source? && track?)
          'https://album.link'
        elsif track? || video?
          'https://song.link'
        end
      end

      def album?
        @args[:model] == 'album'
      end

      def bandcamp_source?
        @args[:source] == 'bandcamp'
      end

      def track?
        @args[:model] == 'track'
      end

      def video?
        @args[:model] == 'video'
      end

      def source_prefix
        SOURCES[
          source_formatted
        ]
      end

      def source_formatted
        @args[:source].to_sym
      end
    end
  end
end
