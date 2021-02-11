module Bandcamp
  module Id
    class Album < Bandcamp::Id::Playlist::Base
      private

      def model_name
        'album'
      end
    end
  end
end
