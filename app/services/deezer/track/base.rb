module Deezer
  module Track
    class Base < Deezer::Base
      API_METHOD = 'song.getListData'.freeze
      include Deezer::Utils::Track

      private

      def primary_args
        [@args[:track_id]]
      end

      def no_data?
        track.blank?
      end

      def track
        @track ||= response_data.dig(
          'results', 'data'
        ).try(:[], 0)
      end

      def payload
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
