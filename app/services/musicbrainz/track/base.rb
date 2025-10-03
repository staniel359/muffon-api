module MusicBrainz
  module Track
    class Base < MusicBrainz::Base
      include MusicBrainz::Utils::Track

      def call
        check_args

        data
      rescue Faraday::BadRequestError
        raise not_found_error
      end

      private

      def required_args
        %i[
          track_id
        ]
      end

      def link
        "#{BASE_LINK}/recording/#{@args[:track_id]}"
      end

      def params
        {
          **super,
          inc: 'artist-credits+tags+releases'
        }
      end

      def data
        { track: track_data }
      end

      def tag_name_formatted(
        tag_data
      )
        tag_data['name']
      end

      alias track response_data
    end
  end
end
