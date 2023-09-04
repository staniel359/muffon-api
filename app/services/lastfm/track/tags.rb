module LastFM
  module Track
    class Tags < LastFM::Tags::Base
      API_METHOD = 'track.getTopTags'.freeze
      MODEL_NAME = 'track'.freeze

      private

      def primary_args
        [
          @args[:artist_name],
          @args[:track_title]
        ]
      end
    end
  end
end
