module YouTubeMusic
  module Mixins
    module Track
      include Muffon::Mixins::Formatting::Collection

      private

      def title
        raw_track_data.dig(
          'title',
          'runs',
          0,
          'text'
        )
      end

      def raw_artists
        raw_raw_artists.map do |raw_artist_data|
          {
            name: raw_artist_data['text'],
            source_id: raw_artist_data.dig(
              'navigationEndpoint',
              'browseEndpoint',
              'browseId'
            )
          }
        end
      end

      def raw_raw_artists
        find_raw_artists_data(
          raw_track_data.dig(
            'longBylineText',
            'runs'
          )
        )
      end

      def youtube_id
        raw_track_data['videoId']
      end

      def source_original_link
        "https://music.youtube.com/watch?v=#{youtube_id}"
      end

      def album_title
        raw_album_data.try(:[], 'text')
      end

      def raw_album_data
        find_raw_album_data(
          raw_track_data.dig(
            'longBylineText',
            'runs'
          )
        )
      end

      def album_youtube_id
        raw_album_data&.dig(
          'navigationEndpoint',
          'browseEndpoint',
          'browseId'
        )
      end

      def image_data
        YouTube::Formatter::Image.call(
          image_url:
        )
      end

      def image_url
        raw_track_data.dig(
          'thumbnail',
          'thumbnails',
          -1,
          'url'
        )
      end

      def duration
        duration_string_to_seconds(
          raw_duration
        )
      end

      def raw_duration
        find_raw_duration(
          raw_track_data.dig(
            'lengthText',
            'runs'
          )
        )
      end

      def audio_present?
        true
      end

      def audio_link
        return if @args[:with_audio].blank?

        YouTubeMusic::Utils::Track::Audio::Link.call(
          track_id: @args[:track_id]
        )
      end
    end
  end
end
