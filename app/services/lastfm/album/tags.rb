module LastFM
  module Album
    class Tags < LastFM::Album::Base
      API_METHOD = 'album.getTopTags'.freeze

      include LastFM::Mixins::Album

      private

      def raw_album_data
        response_data['toptags']
      end

      def album_data
        Muffon::Formatter::Album::Tags.call(
          tags:
        )
      end

      def raw_tags
        raw_album_data['tag']
      end
    end
  end
end
