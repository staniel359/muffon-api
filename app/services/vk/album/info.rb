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
          title: album['title'],
          subtitle: album['subTitle'].to_s,
          artist: artist_name(album),
          cover: album['coverUrl'],
          tracks: tracks
        }
      end

      def tracks
        album['list'].map { |t| track_data(t) }
      end

      def track_data(track)
        VK::Search::Tracks::Track.call(track: track)
      end
    end
  end
end