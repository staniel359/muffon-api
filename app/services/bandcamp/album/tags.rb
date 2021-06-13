module Bandcamp
  module Album
    class Tags < Bandcamp::Album::Info
      private

      def album_data
        { tags: tags }
      end
    end
  end
end
