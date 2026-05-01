module Bandcamp
  module Artist
    class Base < Bandcamp::Base
      def call
        check_args

        check_if_not_found

        data
      end

      private

      def required_args
        %i[
          artist_id
        ]
      end

      def not_found?
        name.blank?
      end

      def request_url
        "#{REQUEST_BASE_URL}/band_details"
      end

      def request_params
        { band_id: @args[:artist_id] }
      end

      def data
        { artist: artist_data }
      end

      def artist_data
        { name: }
      end

      alias raw_artist_data response_data
    end
  end
end
