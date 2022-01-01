module Odnoklassniki
  module Album
    class Tags < Odnoklassniki::Album::Info
      private

      def album_data
        { tags: }
      end
    end
  end
end
