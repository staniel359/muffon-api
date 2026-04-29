module Audius
  module Artist
    class Base < Audius::Base
      def call
        check_args

        data
      rescue Faraday::BadRequestError
        raise not_found_error
      end

      private

      def required_args
        %i[
          artist_id
        ]
      end

      def data
        { artist: artist_data }
      end

      def artist_data
        { name: }
      end

      def name
        artist_info_data.dig(
          :artist,
          :name
        )
      end

      def artist_info_data
        @artist_info_data ||=
          Audius::Artist::Info.call(
            artist_id: @args[:artist_id]
          )
      end

      def link
        "#{BASE_LINK}/users/#{@args[:artist_id]}"
      end
    end
  end
end
