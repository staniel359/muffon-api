module LastFM
  module Artist
    class Tags < LastFM::Tags::Base
      API_METHOD = 'artist.getTopTags'.freeze
      MODEL_NAME = 'artist'.freeze

      private

      def required_args
        %i[
          artist_name
        ]
      end
    end
  end
end
