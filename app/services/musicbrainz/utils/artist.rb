module MusicBrainz
  module Utils
    module Artist
      include Muffon::Utils::Artist

      private

      def name
        artist['name']
      end

      def source_data
        {
          name: source_name,
          id: artist['id']
        }
      end
    end
  end
end
