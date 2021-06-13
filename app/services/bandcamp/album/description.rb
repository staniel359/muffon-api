module Bandcamp
  module Album
    class Description < Bandcamp::Album::Info
      private

      def album_data
        { description: description }
      end
    end
  end
end
