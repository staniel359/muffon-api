module Discogs
  module Album
    class Description < Discogs::Album::Base
      private

      def album_data
        { description: description }
      end
    end
  end
end
