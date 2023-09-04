module LastFM
  module Album
    class Tags < LastFM::Tags::Base
      API_METHOD = 'album.getTopTags'.freeze
      MODEL_NAME = 'album'.freeze

      private

      def primary_args
        [
          @args[:artist_name],
          @args[:album_title]
        ]
      end
    end
  end
end
