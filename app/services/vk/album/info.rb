module VK
  module Album
    class Info < VK::Album::Base
      private

      def album_data
        if @args[:list]
          album_list_data
        else
          album_full_data
        end
      end

      def album_list_data
        self_data
          .merge(album_base_data)
          .merge(album_list_extra_data)
      end

      def album_full_data
        self_data
          .merge(album_base_data)
          .merge(album_extra_data)
          .merge(with_more_data)
      end

      def album_base_data
        @album_base_data ||= {
          source: source_data,
          title:,
          artist: artists_minimal_data,
          artists:,
          image: image_data
        }
      end

      def album_list_extra_data
        {
          release_date:,
          listeners_count:
        }.compact
      end

      def album_extra_data
        {
          listeners_count:
            album['followers'],
          plays_count: album['plays'],
          profiles_count:,
          release_date:,
          tags: tags_truncated,
          tracks:
        }.compact
      end

      def tags_list
        album['genres'].pluck(
          'name'
        )
      end

      def tracks
        album_tracks.dig(
          :album, :tracks
        )
      end

      def album_tracks
        VK::Album::Tracks.call(
          album_id: vk_album_id,
          owner_id: vk_owner_id,
          access_key: vk_access_key,
          profile_id: @args[:profile_id],
          token: @args[:token],
          album_data: album_base_data
        )
      end
    end
  end
end
