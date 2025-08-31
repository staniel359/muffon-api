module VK
  module Artist
    class Info < VK::Artist::Base
      API_METHOD = 'audio.getArtistById'.freeze

      private

      def name
        artist['name']
      end

      def signature
        "/method/#{api_method}" \
          "?access_token=#{access_token}" \
          '&v=5.131' \
          "&artist_id=#{vk_artist_id}" \
          "#{api_secret}"
      end

      def artist_params
        { artist_id: vk_artist_id }
      end
    end
  end
end
