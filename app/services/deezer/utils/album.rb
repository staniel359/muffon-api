module Deezer
  module Utils
    module Album
      include Muffon::Utils::Album

      private

      def title
        album['ALB_TITLE']
      end

      def source_data
        {
          name: source_name,
          id: deezer_id,
          links: source_links
        }
      end

      def deezer_id
        album['ALB_ID'].to_i
      end

      def original_link
        "https://www.deezer.com/album/#{deezer_id}"
      end

      def streaming_link
        streaming_link_formatted(
          'album',
          deezer_id
        )
      end

      def artists_list
        album['ARTISTS']
      end

      def image_data
        image_data_formatted(
          album['ALB_PICTURE'], 'album'
        )
      end

      def release_date
        date_formatted(
          album['ORIGINAL_RELEASE_DATE']
        )
      end
    end
  end
end
