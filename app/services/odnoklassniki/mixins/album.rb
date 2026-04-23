module Odnoklassniki
  module Mixins
    module Album
      include Muffon::Mixins::Formatting::Collection

      private

      def title
        raw_album_data['name']
      end

      def raw_artists
        raw_album_data['allArtists'].map do |raw_artist_data|
          {
            name: raw_artist_data['name'],
            source_id: raw_artist_data['id']
          }
        end
      end

      def odnoklassniki_id
        raw_album_data['id']
      end

      def source_original_link
        "https://ok.ru/music/album/#{odnoklassniki_id}"
      end

      def image_data
        Odnoklassniki::Formatter::Image.call(
          image_url:
        )
      end

      def image_url
        raw_album_data['image']
      end

      def release_date
        Muffon::Formatter::Date.call(
          date: raw_release_date
        )
      end

      def raw_release_date
        raw_album_data['year'].to_s
      end

      def raw_tags
        raw_album_data['genres']
      end

      def tag_name_formatted(
        tag_data
      )
        tag_data['label']
      end
    end
  end
end
