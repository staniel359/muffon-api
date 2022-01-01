module SoundCloud
  module Album
    class Description < SoundCloud::Album::Info
      private

      def album_data
        { description: }
      end
    end
  end
end
