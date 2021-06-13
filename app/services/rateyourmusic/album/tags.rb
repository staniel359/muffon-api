module RateYourMusic
  module Album
    class Tags < RateYourMusic::Album::Info
      private

      def album_data
        { tags: tags }
      end
    end
  end
end
