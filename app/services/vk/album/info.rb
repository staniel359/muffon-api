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
        {
          title: album_title(album),
          artist: album_artist_name(album),
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
        track_base_data(track).merge(track_extra_data(track))
      end

      def track_base_data(track)
        {
          id: track_id(track),
          title: track_title(track),
          artist: track_artist_name(track)
        }
      end

      def track_extra_data(track)
        {
          length: track[5],
          has_audio: audio_id(track).present?,
          vk_id: audio_id(track)
        }
      end
    end
  end
end
