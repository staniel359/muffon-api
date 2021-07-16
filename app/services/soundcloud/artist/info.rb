module SoundCloud
  module Artist
    class Info < SoundCloud::Artist::Base
      private

      def name
        response_data['username']
      end
    end
  end
end
