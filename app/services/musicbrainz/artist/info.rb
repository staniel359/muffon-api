module MusicBrainz
  module Artist
    class Info < MusicBrainz::Artist::Base
      private

      def name
        artist['name']
      end
    end
  end
end
