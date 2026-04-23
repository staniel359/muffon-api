module Muffon
  module Utils
    class StreamingLink < Muffon::Base
      SOURCES_PREFIXES_DATA = {
        'amazonmusic' => 'a',
        'bandcamp' => 'b',
        'soundcloud' => 'sc',
        'spotify' => 's',
        'yandexmusic' => 'ya',
        'youtube' => 'y',
        'youtubemusic' => 'y'
      }.freeze
      MODELS_LINKS_DATA = {
        'album' => 'https://album.link',
        'track' => 'https://song.link'
      }.freeze

      def call
        check_args

        data
      end

      private

      def required_args
        %i[
          model
          source_name
          source_model_id
        ]
      end

      def data
        return if base_link.blank? || source_prefix.blank?

        "#{base_link}/#{source_prefix}/#{@args[:source_model_id]}"
      end

      def base_link
        case @args[:model]
        when 'album'
          return if @args[:source_name] == 'youtubemusic'

          MODELS_LINKS_DATA['album']
        when 'track'
          return if @args[:source_name] == 'bandcamp'

          MODELS_LINKS_DATA['track']
        when 'video'
          MODELS_LINKS_DATA['track']
        end
      end

      def source_prefix
        SOURCES_PREFIXES_DATA[@args[:source_name]]
      end
    end
  end
end
