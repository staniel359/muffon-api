module YandexMusic
  module Mixins
    module Album
      include Muffon::Mixins::Formatting::Collection

      private

      def title
        title_with_extra_title(
          raw_title,
          extra_title:
        )
      end

      def raw_title
        raw_album_data['title']
      end

      def extra_title
        raw_album_data['version']
      end

      def raw_artists
        raw_album_data['artists'].map do |raw_artist_data|
          {
            name: raw_artist_data['name'],
            source_id: raw_artist_data['id']
          }
        end.presence || [raw_artist_data]
      end

      def raw_artist_data
        {
          name: 'Unknown Artist',
          source_id: 171
        }
      end

      def yandexmusic_id
        raw_album_data['id']
      end

      def source_original_link
        "https://music.yandex.ru/album/#{yandexmusic_id}"
      end

      def image_data
        YandexMusic::Formatter::Image.call(
          image_url:
        )
      end

      def image_url
        raw_album_data['coverUri']
      end

      def release_date
        return if raw_release_date.blank?

        raw_release_date.to_s
      end

      def raw_release_date
        raw_album_data['year']
      end

      def raw_labels
        raw_album_data['labels']
      end

      def label_name_formatted(
        raw_label_data
      )
        raw_label_data['name']
      end

      def raw_tags
        [raw_album_data['genre']]
      end

      def tag_name_formatted(
        raw_tag_data
      )
        raw_tag_data
      end

      def raw_tracks
        raw_album_data['volumes'].flatten
      end
    end
  end
end
