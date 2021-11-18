module LastFM
  module Artist
    class Tags < LastFM::Tags::Base
      API_METHOD = 'artist.getTopTags'.freeze
      MODEL_NAME = 'artist'.freeze

      private

      def primary_args
        [@args[:artist]]
      end
    end
  end
end
