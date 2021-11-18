module LastFM
  module Artist
    class Base < LastFM::Base
      API_METHOD = 'artist.getInfo'.freeze
      include LastFM::Utils::Artist

      private

      def primary_args
        [@args[:artist]]
      end

      def no_data?
        artist.blank?
      end

      def artist
        @artist ||= response_data['artist']
      end

      def params
        super.merge(artist_params)
      end

      def data
        { artist: artist_data }
      end
    end
  end
end
