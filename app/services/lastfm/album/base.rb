module LastFM
  module Album
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
          album_title
        ]
      end

      def not_found?
        raw_album_data.blank?
      end

      def raw_album_data
        response_data['album']
      end

      def params
        {
          **super,
          artist: param_formatted(
            @args[:artist_name]
          ),
          album: param_formatted(
            @args[:album_title]
          )
        }
      end

      def data
        { album: album_data }
      end
    end
  end
end
