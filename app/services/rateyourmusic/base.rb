module RateYourMusic
  class Base < Muffon::Base
    private

    def response
      RestClient.post(link, payload, headers)
    end

    def link
      "https://rateyourmusic.com/httprequest/#{action}"
    end

    def action
      self.class::ACTION
    end

    def headers
      { cookies: cookies }
    end

    def cookies
      {
        sec_bs: sec_bs,
        sec_id: sec_id,
        sec_ts: sec_ts,
        ulv: session_id
      }
    end

    def sec_bs
      secrets.rateyourmusic[:sec_bs]
    end

    def sec_id
      secrets.rateyourmusic[:sec_id]
    end

    def sec_ts
      secrets.rateyourmusic[:sec_ts]
    end

    def session_id
      secrets.rateyourmusic[:session_id]
    end

    def image_data_formatted(image_data, model)
      RateYourMusic::Utils::Image.call(
        image_data: image_data, model: model
      )
    end
  end
end
