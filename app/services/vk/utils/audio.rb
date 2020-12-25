module VK
  module Utils
    class Audio < VK::Web
      private

      def primary_args
        [@args.ids]
      end

      def request_params
        {
          act: 'reload_audio',
          al: 1,
          ids: ids
        }
      end

      def ids
        @args.ids.join(',')
      end

      def data
        { tracks: tracks_data }
      end

      def tracks_data
        tracks.map do |t|
          {
            title: CGI.unescapeHTML(t[3]),
            artist: CGI.unescapeHTML(t[4]),
            audio_link: audio_link(t)
          }
        end
      end

      def tracks
        response_data.dig(1, 0)
      end

      def audio_link(track)
        VK::Utils::Decoder.call(link: track[2])
      end
    end
  end
end
