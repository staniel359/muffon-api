module VK
  module Artist
    class Info < VK::Artist::Base
      API_METHOD = 'audio.getArtistById'.freeze

      include VK::Mixins::Artist

      private

      def request_params
        {
          **super,
          artist_id: @args[:artist_id]
        }
      end

      def request_raw_signature
        "/method/#{api_method}" \
          "?access_token=#{access_token}" \
          '&v=5.131' \
          "&artist_id=#{@args[:artist_id]}" \
          "#{api_secret}"
      end
    end
  end
end
