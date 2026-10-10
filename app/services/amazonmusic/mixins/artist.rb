module AmazonMusic
  module Mixins
    module Artist
      include AmazonMusic::Mixins::Base

      private

      def name
        raw_artist_data['name']
      end

      def amazonmusic_id
        raw_artist_data['id']
      end

      def source_original_link
        "#{WEB_BASE_URL}/artists/#{amazonmusic_id}"
      end

      def image_data
        AmazonMusic::Formatter::Image.call(
          image_id:
        )
      end

      def image_id
        raw_artist_data['images'].find do |image_data|
          image_data['id'].include?(
            ':PROFILE'
          )
        end['id'].split(':')[0]
      end
    end
  end
end
