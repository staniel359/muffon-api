module MusicBrainz
  module Utils
    module Artist
      MODEL_NAME = 'artist'.freeze

      include Muffon::Utils::Artist

      private

      def name
        artist['name']
      end

      def source_data
        {
          name: source_name,
          id: musicbrainz_id,
          links: source_links_data
        }
      end

      def musicbrainz_id
        artist['id']
      end

      def original_link
        "https://musicbrainz.org/#{model_name}/#{musicbrainz_id}"
      end
    end
  end
end
