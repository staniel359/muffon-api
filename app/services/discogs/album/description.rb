module Discogs
  module Album
    class Description < Discogs::Album::Info
      private

      def album_data
        { description: description }
      end
    end
  end
end
