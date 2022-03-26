module VK
  module Album
    class Info < VK::Album::Base
      private

      def album_data
        muffon_data
          .merge(album_base_data)
          .merge(album_extra_data)
          .merge(with_more_data)
      end

      def album_base_data
        {
          source_id: SOURCE_ID,
          title:,
          extra_title:,
          artists:
        }
      end

      def album_extra_data
        {
          image: image_data,
          release_date:,
          plays_count:,
          tags: tags&.first(5),
          tracks:
        }.compact
      end

      def plays_count
        album['plays']
      end

      def tags_list
        album['genres'].map do |g|
          g['name']
        end
      end

      def tracks
        album_tracks_data.dig(
          :album, :tracks
        )
      end

      def album_tracks_data
        VK::Album::Tracks.call(
          album_id: vk_album_id,
          owner_id: vk_owner_id,
          access_key: vk_access_key,
          profile_id: @args[:profile_id]
        )
      end
    end
  end
end
