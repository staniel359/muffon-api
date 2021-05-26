module LastFM
  module Artist
    class Base < LastFM::Base
      API_METHOD = 'artist.getInfo'.freeze

      private

      def primary_args
        [@args.artist]
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

      def name
        artist['name'] || artist.dig(
          '@attr', 'artist'
        )
      end

      def description
        description_formatted(
          artist.dig('bio', 'content')
        )
      end
    end
  end
end
