module RateYourMusic
  module Album
    class Tags < RateYourMusic::Album::Base
      private

      def album_data
        { tags: tags }
      end
    end
  end
end
