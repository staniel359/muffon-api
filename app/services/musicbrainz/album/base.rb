module MusicBrainz
  module Album
    class Base < MusicBrainz::Base
      def call
        check_args

        data
      rescue Faraday::BadRequestError
        raise not_found_error
      end

      private

      def required_args
        %i[
          album_id
        ]
      end

      def link
        "#{BASE_LINK}/release/#{@args[:album_id]}"
      end

      def params
        {
          **super,
          inc: 'artist-credits+tags+labels+recordings'
        }
      end

      def data
        { album: album_data }
      end

      alias raw_album_data response_data
    end
  end
end
