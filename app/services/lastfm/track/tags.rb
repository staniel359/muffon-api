module LastFM
  module Track
    class Tags < LastFM::Tags::Base
      API_METHOD = 'track.getTopTags'.freeze
      MODEL_NAME = 'track'.freeze

      private

      def required_args
        %i[
          artist_name
          track_title
        ]
      end
    end
  end
end
