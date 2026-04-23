module MusicBrainz
  module Mixins
    module Label
      private

      def name
        raw_label_data['name']
      end

      def musicbrainz_id
        raw_label_data['id']
      end

      def source_original_link
        "https://musicbrainz.org/label/#{musicbrainz_id}"
      end
    end
  end
end
