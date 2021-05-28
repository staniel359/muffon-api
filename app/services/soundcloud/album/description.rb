module SoundCloud
  module Album
    class Description < SoundCloud::Album::Base
      private

      def album_data
        { description: description }
      end
    end
  end
end
