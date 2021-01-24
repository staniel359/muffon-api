module LastFM
  module Album
    class Tags < LastFM::Tags::Base
      private

      def primary_args
        [@args.artist, @args.album]
      end

      def model_name
        'album'
      end

      def data
        { album: album_data }
      end

      def album_data
        {
          title: extra_data['album'],
          artist: artist_data,
          tags: tags
        }
      end
    end
  end
end
