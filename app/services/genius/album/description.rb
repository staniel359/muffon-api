module Genius
  module Album
    class Description < Genius::Album::Info
      private

      def album_data
        { description: description }
      end
    end
  end
end
