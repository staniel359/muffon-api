module VK
  module Album
    class Tracks < VK::Album::Base
      API_METHOD = 'audio.get'.freeze

      private

      def primary_args
        [
          @args[:album_id],
          @args[:owner_id],
          @args[:access_key]
        ]
      end

      def tracks_list
        response_data['items']
      end

      def album_params
        {
          album_id: vk_album_id,
          owner_id: vk_owner_id,
          access_key: vk_access_key
        }
      end

      def signature
        "/method/#{API_METHOD}" \
          "?access_token=#{access_token}" \
          '&v=5.131' \
          "&album_id=#{vk_album_id}" \
          "&owner_id=#{vk_owner_id}" \
          "&access_key=#{vk_access_key}" \
          "#{api_secret}"
      end

      def album_data
        { tracks: }
      end

      def track_data_formatted(track)
        VK::Album::Tracks::Track.call(
          track:,
          profile_id: @args[:profile_id],
          token: @args[:token],
          album_data: @args[:album_data]
        )
      end
    end
  end
end
