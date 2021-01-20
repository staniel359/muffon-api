module VK
  module Track
    class Info < VK::Web
      private

      def primary_args
        [@args.track_id]
      end

      def no_data?
        super || track.blank?
      end

      def track
        @track ||= response_data.dig(1, 0, 0)
      end

      def params
        {
          act: 'reload_audio',
          al: 1,
          ids: @args.track_id
        }
      end

      def data
        { track: track_data }
      end

      def track_data
        track_base_data.merge(track_extra_data)
      end

      def track_base_data
        {
          id: track_id(track),
          title: track_title(track),
          artist: track_artist_name(track)
        }
      end

      def track_extra_data
        {
          images: images(track[14], 'track'),
          album: album_data,
          length: track[5],
          audio: audio_data
        }
      end

      def album_data
        return {} if track[19].blank?

        owner_id, vk_id, access_hash = track[19]

        {
          vk_id: vk_id,
          owner_id: owner_id,
          access_hash: access_hash
        }
      end

      def audio_data
        {
          present: track[2].present?,
          link: audio_link,
          source: 'vk'
        }
      end

      def audio_link
        VK::Utils::Decoder.call(link: track[2])
      end
    end
  end
end
