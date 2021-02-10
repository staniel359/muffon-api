module Bandcamp
  module ID
    class Track < Bandcamp::ID::Playlist::Base
      private

      def model_name
        'track'
      end
    end
  end
end
