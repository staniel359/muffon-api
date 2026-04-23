module MusicBrainz
  module Mixins
    module Artist
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
    end
  end
end
