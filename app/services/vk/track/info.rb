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
          album: album_title(album_data),
          images: images,
          length: track[5],
          audio: audio_data
        }
      end

      def album_data
        @album_data ||= VK::Album::Info.call(album_args)[:album].to_h
      end

      def album_args
        return {} unless track[19]

        {
          album_id: track[19][1],
          owner_id: track[19][0],
          access_hash: track[19][2],
          track: true
        }
      end

      def images
        {
          original: album_images[:original].to_s,
          medium: album_images[:medium].to_s,
          small: track_images[1].to_s,
          extrasmall: track_images[0].to_s
        }
      end

      def album_images
        album_data[:images].to_h
      end

      def track_images
        track[14].split(',')
      end

      def audio_data
        {
          present: audio_link.present?,
          link: audio_link,
          source: 'vk'
        }
      end

      def audio_link
        @audio_link ||= VK::Utils::Decoder.call(link: track[2])
      end
    end
  end
end
