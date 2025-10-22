module LastFM
  module Utils
    module Web
      include Muffon::Utils::Request

      private

      def params
        {}
      end

      def headers
        {
          'Cookie' => 'lfmjs=1; lfmjs=1; sessionid=.eJyNkt1umzAYQJ8lSL0bxBgb27kL0ISkP0lpuqS9QTYYQkNxhkE0mvbuc9pM2i6m7c6Wz9F3pM_frZT33T7ttWzTPdd7a2I1LKh1FAdAqU3dv_C7duFGMXo-HdTc3-XK-mJpqXWlmrTKDU89IliOoZ17FNvIk4XNfB_YpMgYEznLAQLG-W3QhzaZTJ4er5NFZA4IY8AIRn9igmcH2ZzZunhzBimcYRgcfjxq5ww5l3fnqdXBBTX-sW-1UaTPac4QxRC5qCgYEZx7jEDGqMe4D3yUSUEIhr4HCIIu9jFzKUIucU2IAc2VYY-OOAAj4NLE3dg-3N7Aur_dlGoEHOgs85BjtZtPAztOijQo13M2GxxvBTsZLJLpZvi6XCsxU2iVSbts3sEB07c6XmxV2Ib96lCeg_UlGElOiRAko5RwM9XzOXK9TGQgpxDx_w7-a24Dod3460MQvSZx9Jjffmu6_dRxTez9kfbz62y…ph7e3e2yh8zzc4pg4sq; _lc2_fpi_meta=%7B%22w%22%3A1740037610023%7D; s_getNewRepeat=1761076776350-Repeat; lfmjs=1; cbsiaa=26307421565918441717549725919538; s_vnum=1763450542917%26vn%3D3; _BB.d=0|||3; dw-tag=content%3Bmantle_skin; s_sq=%5B%5BB%5D%5D; prevPageType=image_gallery_list; s_cc=true; lfmanon=0; not_first_visit=1; _li_dcdm_c=.last.fm; _BB.bs=d|1; AMCVS_10D31225525FF5790A490D4D%40AdobeOrg=1; s_invisit=true; s_lv_undefined_s=Less%20than%201%20day; lpfrmo=0; X-UA-Device-Type=desktop; X-UA-Country-Code=BY',
          'User-Agent' => USER_AGENT,
          'DNT' => '1',
          'Referer' => 'https://www.last.fm'
        }
      end

      def proxy
        proxies[:us]
      end

      def param_formatted(
        param
      )
        CGI.escape(
          CGI.escape(
            super
          )
        )
      end

      alias response_data html_response_data
    end
  end
end
