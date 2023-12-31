module MusicBrainz
  module Track
    class Base < MusicBrainz::Base
      include MusicBrainz::Utils::Track

      def call
        super
      rescue Faraday::BadRequestError
        not_found
      end

      private

      def primary_args
        [@args[:track_id]]
      end

      def link
        "#{BASE_LINK}/recording/#{@args[:track_id]}"
      end

      def params
        super
          .merge(track_params)
      end

      def track_params
        { inc: 'artist-credits+tags+releases' }
      end

      def data
        { track: track_data }
      end

      alias track response_data
    end
  end
end
