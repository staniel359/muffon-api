module VK
  module Artist
    class Info < VK::Base
      API_METHOD = 'audio.getArtistById'.freeze

      private

      def primary_args
        [@args.artist_id]
      end

      def params
        super.merge(artist_params)
      end

      def signature
        "/method/#{api_method}"\
          "?access_token=#{access_token}"\
          '&v=5.131'\
          "&artist_id=#{@args.artist_id}"\
          "#{api_secret}"
      end

      def artist_params
        { artist_id: @args.artist_id }
      end

      def data
        { artist: artist_data }
      end

      def artist_data
        { name: name }
      end

      def name
        response_data['name']
      end
    end
  end
end
