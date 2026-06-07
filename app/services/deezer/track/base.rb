module Deezer
  module Track
    class Base < Deezer::Base
      API_METHOD = 'song.getListData'.freeze

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
        raw_track_data.blank?
      end

      def raw_track_data
        response_data.dig(
          'results',
          'data',
          0
        )
      end

      def request_payload
        {
          sng_ids: [@args[:track_id]]
        }.to_json
      end

      def data
        { track: track_data }
      end
    end
  end
end
