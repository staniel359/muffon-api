module Muffon
  module Utils
    class StreamingLink < Muffon::Base
      SOURCES = {
        'amazonmusic' => 'a',
        'bandcamp' => 'b',
        'deezer' => 'd',
        'soundcloud' => 'sc',
        'spotify' => 's',
        'yandexmusic' => 'ya',
        'youtube' => 'y',
        'youtubemusic' => 'y'
      }.freeze

      def call
        check_args

        return if no_data?

        data
      end

      private

      def required_args
        %i[
          model
          source
          model_id
        ]
      end

      def no_data?
        base_link.blank? ||
          source_prefix.blank?
      end

      def base_link
        if album? || bandcamp_track?
          'https://album.link'
        elsif track? || video?
          'https://song.link'
        end
      end

      def album?
        model == 'album'
      end

      def model
        @args[:model]
      end

      def bandcamp_track?
        source == 'bandcamp' && track?
      end

      def source
        @args[:source]
      end

      def track?
        model == 'track'
      end

      def video?
        model == 'video'
      end

      def source_prefix
        SOURCES[source]
      end

      def data
        "#{base_link}/#{source_prefix}/#{@args[:model_id]}"
      end
    end
  end
end
