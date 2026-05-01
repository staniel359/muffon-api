module MusicBrainz
  module Mixins
    module Artist
      include Muffon::Mixins::Artist

      private

      def name
        raw_artist_data['name']
      end

      def musicbrainz_id
        raw_artist_data['id']
      end

      def source_original_link
        "https://musicbrainz.org/artist/#{musicbrainz_id}"
      end

      def image_data
        artist_record.image_data
      end
    end
  end
end
