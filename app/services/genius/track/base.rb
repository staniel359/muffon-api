module Genius
  module Track
    class Base < Genius::Base
      include Genius::Mixins::Track

      def call
        check_args

        data
      rescue Faraday::ResourceNotFound
        raise not_found_error
      end

      private

      def required_args
        %i[
          track_id
        ]
      end

      def data
        { track: track_data }
      end

      def raw_track_data
        response_data.dig(
          'response',
          'song'
        )
      end

      def link
        "#{BASE_LINK}/songs/#{@args[:track_id]}"
      end
    end
  end
end
