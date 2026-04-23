module SoundCloud
  module Mixins
    module Album
      include Muffon::Mixins::Formatting::Collection

      private

      def title
        raw_album_data['title']
      end

      def raw_artists
        [raw_artist_data]
      end

      def raw_artist_data
        {
          name: raw_album_data.dig(
            'user',
            'username'
          ),
          source_id: raw_album_data.dig(
            'user',
            'id'
          )
        }
      end

      def soundcloud_id
        raw_album_data['id']
      end

      def source_original_link
        raw_album_data['permalink_url']
      end

      def image_data
        SoundCloud::Formatter::Image.call(
          image_url:
        )
      end

      def image_url
        raw_album_data['artwork_url']
      end

      def release_date
        return if raw_release_date.blank?

        Muffon::Formatter::Date.call(
          date: raw_release_date
        )
      end

      def raw_release_date
        raw_album_data
          .values_at(
            'release_year',
            'release_month',
            'release_day'
          )
          .compact
      end

      def description
        raw_album_data['description']
      end

      def raw_tags
        [
          *raw_album_data['genre'],
          *raw_album_data['tags']&.split(/\s?"\s?/)
        ]
          .compact_blank
      end

      def tag_name_formatted(
        tag_data
      )
        tag_data
      end
    end
  end
end
