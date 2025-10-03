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
      LINKS = {
        album: 'https://album.link',
        track: 'https://song.link'
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
        @base_link ||=
          case @args[:model]
          when 'album'
            LINKS[:album]
          when 'track'
            if @args[:source] == 'bandcamp'
              LINKS[:album]
            else
              LINKS[:track]
            end
          when 'video'
            LINKS[:track]
          end
      end

      def source_prefix
        SOURCES[@args[:source]]
      end

      def data
        "#{base_link}/#{source_prefix}/#{@args[:model_id]}"
      end
    end
  end
end
