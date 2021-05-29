module VK
  module Album
    class Base < VK::Base
      include VK::Utils::Album

      private

      def primary_args
        [@args.album_id]
      end

      def no_data?
        super || album.blank?
      end

      def album
        @album ||= response_data.dig(1, 0)
      end

      def params
        {
          act: 'load_section',
          al: 1,
          playlist_id: @args.album_id,
          owner_id: @args.owner_id,
          access_hash: @args.access_hash,
          offset: @args.next_page,
          type: 'playlist'
        }
      end

      def data
        { album: album_data }
      end
    end
  end
end
