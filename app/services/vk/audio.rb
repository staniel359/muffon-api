module VK
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
          title: t[3],
          artist: t[4],
          link: link(t)
        }
      end
    end

    def tracks
      parsed_response.dig(1, 0)
    end

    def link(track)
      VK::Decoder.call(link: track[2])
    end
  end
end
