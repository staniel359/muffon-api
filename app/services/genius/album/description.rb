module Genius
  module Album
    class Description < Genius::Album::Base
      private

      def album_data
        { description: description }
      end
    end
  end
end
