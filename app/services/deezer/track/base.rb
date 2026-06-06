module Deezer
  module Track
    class Base < Deezer::Base
      API_METHOD = 'song.getListData'.freeze

      include Deezer::Utils::Track

      def call
        check_args

        check_if_not_found

        data
      end

      private

      def required_args
        %i[
          track_id
        ]
      end

      def not_found?
        track.blank?
      end

      def track
        response_data.dig(
          'results', 'data'
        ).try(:[], 0)
      end

      def payload
        {
          sng_ids: [
            @args[:track_id]
          ]
        }.to_json
      end

      def data
        { track: track_data }
      end
    end
  end
end
