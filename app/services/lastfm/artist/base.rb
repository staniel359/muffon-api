module LastFM
  module Artist
    class Base < LastFM::Base
      API_METHOD = 'artist.getInfo'.freeze

      include LastFM::Utils::Artist

      def call
        check_args

        check_if_not_found

        data
      rescue Faraday::ResourceNotFound
        raise not_found_error
      end

      private

      def required_args
        %i[
          artist_name
        ]
      end

      def not_found?
        artist.blank?
      end

      def artist
        response_data['artist']
      end

      def params
        {
          **super,
          **artist_params
        }
      end

      def data
        { artist: artist_data }
      end

      def artist_data
        { name: }
      end
    end
  end
end
