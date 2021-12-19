module RateYourMusic
  class Base < Muffon::Base
    SOURCE_ID = 'rateyourmusic'.freeze

    private

    def link
      "https://rateyourmusic.com/httprequest/#{action}"
    end

    def action
      self.class::ACTION
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

    def artist_data_formatted(artist)
      {
        name: artist.text,
        rateyourmusic_id:
          artist_rateyourmusic_id(artist)
      }
    end

    def artist_rateyourmusic_id(artist)
      return '' if artist['title'].blank?

      artist['title'].scan(
        /\d+/
      )[0].to_i
    end

    def image_data_formatted(image, model)
      RateYourMusic::Utils::Image.call(
        image: image, model: model
      )
    end

    alias response post_response
  end
end
