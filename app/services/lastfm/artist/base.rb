module LastFM
  module Artist
    class Base < LastFM::Base
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
        raw_artist_data.blank?
      end

      def raw_artist_data
        response_data['artist']
      end

      def request_params
        {
          **super,
          artist: param_formatted(
            @args[:artist_name]
          )
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
