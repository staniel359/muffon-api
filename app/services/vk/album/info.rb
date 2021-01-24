module VK
  module Album
    class Info < VK::Web
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

      def album_data
        album_base_data.merge(album_extra_data)
      end

      def album_base_data
        {
          title: album_title(album),
          artist: album_artist_data(album),
          source: 'vk'
        }
      end

      def album_extra_data
        {
          images: images_data(album['coverUrl'], 'album'),
          released: released,
          plays_count: album['listens'].to_i,
          tracks: tracks_data
        }
      end

      def released
        album['infoLine1'].split('<span class="dvd"></span>').last
      end

      def tracks_data
        tracks_list.map { |t| track_data(t) }
      end

      def tracks_list
        album['list']
      end

      def track_data(track)
        {
          id: track_id(track),
          title: track_title(track),
          artist: track_artist_data(track),
          length: track[5],
          audio: audio_data(track)
        }
      end

      def audio_data(track)
        {
          present: audio_id(track).present?,
          id: audio_id(track),
          source: 'vk'
        }
      end
    end
  end
end
