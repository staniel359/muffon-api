module VK
  module Track
    class Albums < VK::Track::Info
      private

      def track_data
        Muffon::Formatter::Source::Track::Albums.call(
          source_original_link:,
          source_name:,
          source_track_id: vk_id,
          title:,
          artists:,
          albums:
        )
      end

      def albums
        [album_data].compact
      end

      def album_data
        return if raw_album_data.blank?

        VK::Album::Info.call(
          album_id: album_vk_id,
          owner_id: album_vk_owner_id,
          access_key: album_vk_access_key,
          is_list: true,
          **self_args
        )[:album]
      end
    end
  end
end
