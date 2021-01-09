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

      def request_params
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
          artist: album_artist_name(album),
          source: 'vk'
        }
      end

      def album_extra_data
        {
          images: images,
          released: released,
          plays_count: album['listens'].to_i,
          tracks: (tracks unless @args.track)
        }
      end

      def images
        {
          original: album['coverUrl'],
          medium: album['coverUrl']
        }
      end

      def released
        album['infoLine1'].split('<span class="dvd"></span>').last
      end

      def tracks
        album['list'].map { |t| track_data(t) }
      end

      def track_data(track)
        {
          id: track_id(track),
          title: track_title(track),
          artist: track_artist_name(track),
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
