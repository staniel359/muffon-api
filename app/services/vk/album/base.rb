module VK
  module Album
    class Base < VK::Base
      API_METHOD = 'audio.getPlaylistById'.freeze

      include VK::Utils::Album

      private

      def primary_args
        [
          @args[:album_id],
          @args[:owner_id],
          @args[:access_key]
        ]
      end

      def no_data?
        album.blank?
      end

      def params
        super.merge(
          album_params
        )
      end

      def album_params
        {
          playlist_id: vk_album_id,
          owner_id: vk_owner_id,
          access_key: vk_access_key,
          lang: language
        }
      end

      def vk_album_id
        @args[:album_id]
      end

      def vk_owner_id
        @args[:owner_id]
      end

      def vk_access_key
        @args[:access_key]
      end

      def signature
        "/method/#{API_METHOD}" \
          "?access_token=#{access_token}" \
          '&v=5.131' \
          "&playlist_id=#{vk_album_id}" \
          "&owner_id=#{vk_owner_id}" \
          "&access_key=#{vk_access_key}" \
          "&lang=#{language}" \
          "#{api_secret}"
      end

      def data
        { album: album_data }
      end

      alias album response_data
    end
  end
end
