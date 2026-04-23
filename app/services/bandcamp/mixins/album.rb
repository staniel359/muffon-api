module Bandcamp
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
          name: artist_name,
          source_id: artist_bandcamp_id
        }
      end

      def artist_name
        raw_album_data['band_name']
      end

      def artist_bandcamp_id
        raw_album_data['band_id']
      end

      def bandcamp_id
        raw_album_data['item_id']
      end

      def bandcamp_model
        raw_album_data['item_type']
      end

      def source_original_link
        raw_album_data['bandcamp_url']
      end

      def image_data
        Bandcamp::Formatter::Image.call(
          image_url:
        )
      end

      def image_url
        "https://f4.bcbits.com/img/a#{image_id}_10.jpg"
      end

      def image_id
        raw_album_data['art_id']
      end

      def release_date
        Muffon::Formatter::Date.call(
          date: raw_release_date
        )
      end

      def raw_release_date
        raw_album_data['release_date']
      end

      def raw_tags
        raw_album_data['tags']
      end

      def tag_name_formatted(
        tag_data
      )
        tag_data['name']
      end

      def description
        raw_album_data['about']
      end

      def raw_tracks
        raw_album_data['tracks']
      end
    end
  end
end
