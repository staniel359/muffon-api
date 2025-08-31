module SoundCloud
  module Artist
    class Info < SoundCloud::Artist::Base
      private

      def name
        artist['username']
      end
    end
  end
end
