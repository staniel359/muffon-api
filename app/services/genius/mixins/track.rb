module Genius
  module Mixins
    module Track
      include Muffon::Mixins::Formatting::Collection

      private

      def title
        raw_track_data['title_with_featured']
      end

      def raw_artists
        [raw_artist_data]
      end

      def raw_artist_data
        {
          name: raw_track_data.dig(
            'primary_artist',
            'name'
          ),
          source_id: raw_track_data.dig(
            'primary_artist',
            'id'
          )
        }
      end

      def genius_id
        raw_track_data['id']
      end

      def source_original_link
        raw_track_data['url']
      end

      def album_title
        raw_album_data.try(:[], 'name')
      end

      def raw_album_data
        raw_albums.try(:[], 0)
      end

      def raw_albums
        raw_track_data['albums']
      end

      def album_genius_id
        raw_album_data.try(:[], 'id')
      end

      def image_data
        Genius::Formatter::Image.call(
          image_url:
        )
      end

      def image_url
        raw_track_data['song_art_image_url']
      end

      def raw_tags
        raw_track_data['tags']
      end

      def tag_name_formatted(
        tag_data
      )
        tag_data['name']
      end

      def description
        raw_track_data['description_preview']
      end

      def release_date
        Muffon::Formatter::Date.call(
          date: raw_release_date
        )
      end

      def raw_release_date
        raw_release_date_items_data
          .values
          .compact
      end

      def raw_release_date_items_data
        raw_track_data['release_date_components'] || {}
      end

      def audio_present?
        false
      end

      def audio_link
        nil
      end

      def genius_slug
        raw_track_data['path']
      end
    end
  end
end
