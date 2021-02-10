module Bandcamp
  module ID
    class Album < Bandcamp::ID::Playlist::Base
      private

      def model_name
        'album'
      end
    end
  end
end
