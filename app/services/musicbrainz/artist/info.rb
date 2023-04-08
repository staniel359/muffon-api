module MusicBrainz
  module Artist
    class Info < MusicBrainz::Base
      private

      def primary_args
        [@args[:artist_id]]
      end

      def link
        "#{BASE_LINK}/artist/#{@args[:artist_id]}"
      end

      def data
        { artist: artist_data }
      end

      def artist_data
        { name: }
      end

      def name
        response_data['name']
      end
    end
  end
end
