module VK
  class Audio < VK::Base
    private

    def primary_args
      [@args.ids]
    end

    def no_data?
      parsed_response.is_a?(String)
    end

    def parsed_response
      @parsed_response ||= JSON.parse(
        response_to_json
      ).dig('payload', 1, 0)
    end

    def request_params
      {
        act: 'reload_audio',
        al: 1,
        ids: @args.ids.join(',')
      }
    end

    def data
      { tracks: tracks_data }
    end

    def tracks_data
      parsed_response.map do |t|
        {
          title: t[3],
          artist: t[4],
          link: link(t)
        }
      end
    end

    def link(track)
      VK::Decoder.call(link: track[2])
    end
  end
end
