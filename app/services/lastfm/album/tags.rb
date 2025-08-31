module LastFM
  module Album
    class Tags < LastFM::Tags::Base
      API_METHOD = 'album.getTopTags'.freeze
      MODEL_NAME = 'album'.freeze

      private

      def required_args
        %i[
          artist_name
          album_title
        ]
      end
    end
  end
end
