module Odnoklassniki
  module Album
    class Tags < Odnoklassniki::Album::Base
      private

      def album_data
        {
          title: title,
          artist: artist_data(album),
          tags: tags
        }
      end
    end
  end
end
