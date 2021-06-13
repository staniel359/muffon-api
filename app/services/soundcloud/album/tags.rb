module SoundCloud
  module Album
    class Tags < SoundCloud::Album::Info
      private

      def album_data
        { tags: tags }
      end
    end
  end
end
