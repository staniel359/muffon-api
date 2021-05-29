module VK
  module Album
    class Info < VK::Album::Base
      private

      def album_data
        album_base_data
          .merge(album_extra_data)
          .merge(with_more_data)
      end

      def album_base_data
        {
          title: title,
          extra_title: extra_title,
          vk_id: vk_id,
          vk_owner_id: vk_owner_id,
          vk_access_hash: vk_access_hash,
          artist: artist_formatted,
          artists: artists,
          source_id: SOURCE_ID
        }
      end

      def album_extra_data
        {
          image: image_data,
          release_date: release_date,
          plays_count: plays_count,
          tags: tags,
          tracks: tracks_data
        }
      end

      def release_date
        info_split[-1]
      end

      def info_split
        @info_split ||= album['infoLine1'].split(
          '<span class="dvd"></span>'
        )
      end

      def plays_count
        album['listens'].to_i
      end

      def tags_list
        info_split[0].split(', ')
      end

      def tracks_data
        tracks_list.map do |t|
          track_data_formatted(t)
        end
      end

      def tracks_list
        album['list']
      end

      def track_data_formatted(track)
        VK::Album::Info::Track.call(
          track: track
        )
      end
    end
  end
end
