module Deezer
  module Utils
    module Artist
      include Muffon::Utils::Artist

      private

      def name
        artist['ART_NAME']
      end

      def source_data
        {
          name: source_name,
          id: artist['ART_ID'].to_i
        }
      end
    end
  end
end
