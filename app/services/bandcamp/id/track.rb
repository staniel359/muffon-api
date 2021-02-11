module Bandcamp
  module Id
    class Track < Bandcamp::Id::Playlist::Base
      private

      def model_name
        'track'
      end
    end
  end
end
