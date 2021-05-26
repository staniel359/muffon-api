module LastFM
  module Album
    class Base < LastFM::Base
      API_METHOD = 'album.getInfo'.freeze
      include LastFM::Utils::Album

      private

      def primary_args
        [
          @args.artist,
          @args.album
        ]
      end

      def no_data?
        album.blank?
      end

      def album
        @album ||= response_data['album']
      end

      def params
        super.merge(album_params)
      end

      def data
        { album: album_data }
      end

      def listeners_count
        album['listeners'].to_i
      end

      def description
        description_formatted(
          album.dig('wiki', 'content')
        )
      end
    end
  end
end
