module Deezer
  module Mixins
    module Album
      include Muffon::Mixins::Formatting::Collection

      private

      def title
        raw_album_data['ALB_TITLE']
      end

      def raw_artists
        raw_album_data['ARTISTS'].map do |raw_artist_data|
          {
            name: raw_artist_data['ART_NAME'],
            source_id: raw_artist_data['ART_ID'].to_i
          }
        end
      end

      def deezer_id
        raw_album_data['ALB_ID'].to_i
      end

      def source_original_link
        "https://www.deezer.com/album/#{deezer_id}"
      end

      def image_data
        Deezer::Formatter::Image.call(
          image_id:,
          model: 'album'
        )
      end

      def image_id
        raw_album_data['ALB_PICTURE']
      end

      def release_date
        Muffon::Formatter::Date.call(
          date: raw_release_date
        )
      end

      def raw_release_date
        raw_album_data['ORIGINAL_RELEASE_DATE']
      end

      def labels
        raw_album_data['LABEL_NAME']
          .split('/')
          .uniq
          .compact_blank
      end
    end
  end
end
