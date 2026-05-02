module YandexMusic
  module Mixins
    module Track
      include Muffon::Mixins::Formatting::Collection

      private

      def title
        title_with_extra_title(
          raw_title,
          extra_title:
        )
      end

      def raw_title
        raw_track_data['title']
      end

      def extra_title
        raw_track_data['version']
      end

      def raw_artists
        raw_track_data['artists'].map do |raw_artist_data|
          {
            name: raw_artist_data['name'],
            source_id: raw_artist_data['id']
          }
        end
      end

      def yandexmusic_id
        raw_track_data['id'].to_i
      end

      def source_original_link
        "https://music.yandex.ru/track/#{yandexmusic_id}"
      end

      def album_title
        return if raw_album_data.blank?

        title_with_extra_title(
          album_main_title,
          extra_title: album_extra_title
        )
      end

      def raw_album_data
        raw_albums[0]
      end

      def raw_albums
        raw_track_data['albums']
      end

      def album_main_title
        raw_album_data['title']
      end

      def album_extra_title
        raw_album_data['version']
      end

      def album_yandexmusic_id
        raw_album_data.try(:[], 'id')
      end

      def image_data
        YandexMusic::Formatter::Image.call(
          image_url:
        )
      end

      def image_url
        raw_track_data['coverUri']
      end

      def duration
        return if raw_duration.blank?

        raw_duration.to_i / 1_000
      end

      def raw_duration
        raw_track_data['durationMs']
      end

      def audio_present?
        raw_track_data['available']
      end

      def audio_link
        return if @args[:with_audio].blank?

        YandexMusic::Utils::Track::Audio::Link.call(
          track_id: @args[:track_id]
        )
      end
    end
  end
end
