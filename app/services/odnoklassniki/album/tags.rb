module Odnoklassniki
  module Album
    class Tags < Odnoklassniki::Album::Base
      private

      def album_data
        { tags: tags }
      end
    end
  end
end
