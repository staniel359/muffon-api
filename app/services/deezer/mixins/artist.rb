module Deezer
  module Mixins
    module Artist
      private

      def name
        raw_artist_data['ART_NAME']
      end

      def deezer_id
        raw_artist_data['ART_ID'].to_i
      end

      def source_original_link
        "https://www.deezer.com/artist/#{deezer_id}"
      end

      def image_data
        Deezer::Formatter::Image.call(
          image_id:,
          model: 'artist'
        )
      end

      def image_id
        nil
      end
    end
  end
end
