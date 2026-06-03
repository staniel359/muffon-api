module LastFM
  module Mixins
    module Web
      REQUEST_BASE_URL = 'https://www.last.fm'.freeze

      private

      def response_data
        @response_data ||=
          Muffon::Request.call(
            url: request_url,
            method: 'GET',
            response_type: 'html',
            params: request_params,
            headers: request_headers,
            cookies: request_cookies,
            proxy: request_proxy
          )
      rescue Faraday::ClientError => error
        if error.response_status == 406
          raise not_found_error
        else
          raise error
        end
      end

      def request_url
        REQUEST_BASE_URL
      end

      def request_params
        { '_pjax' => '#content' }
      end

      def request_headers
        {
          'DNT' => '1',
          'Host' => 'www.last.fm',
          'Referer' => request_url,
          'Upgrade-Insecure-Requests' => '1',
          'X-NewRelic-ID' => 'UwYPV15QGwYFXFlXDgU=',
          'X-PJAX' => 'true',
          'X-PJAX-Container' => '#content',
          'X-Requested-With' => 'XMLHttpRequest'
        }
      end

      def request_cookies
        {
          '_BB.bs' => 'c|4',
          'csrftoken' => 'wkfihyCb31YI1BsSH6cYySjzpBU7fTCC',
          'dw-tag' => 'content;mantle_skin',
          'lfmanon' => '0',
          'lfmjs' => '1',
          'lpfrmo' => '0',
          'not_first_visit' => '1',
          'OptanonAlertBoxClosed' => '2026-05-26T23:04:27.828Z',
          'OptanonConsent' => 'isGpcEnabled=0&datestamp=Thu+Jun+04+2026+00:09:39+GMT+0300+(Moscow+Standard+Time)&version=202604.2.0&browserGpcFlag=0&isIABGlobal=false&hosts=&consentId=81328fbf-0dab-4ee9-b45b-5439b02a71df&interactionCount=0&isAnonUser=1&landingPath=NotLandingPage&groups=1:1,2:1,3:1,4:0,5:1&AwaitingReconsent=false&geolocation=GB;HM&isDntEnabled=1',
          'prevPageType' => 'artist_similar',
          'sessionid' => '.eJyVVcmOs0gafJc6j0skq_mlPtiADdgkZl8uFmuxG5ud1rz7JK5qdY9GPZo5IJGZ3xLxkRH8_nEPhj67D13yumdBl338-mjYY9Xx4hF7PMxq8APlJQFeJL2lfJxpN358_OOjS7oufzT3PEbxyR7s9xGT7liKYXYknlK7gKajHQgBzQI6JfEkRTl_afRO-_Xrl2UIusSjF5KiMJahyH8PC4OoTJottkrrzykJP6dp-gzatvvcgj5_zj-tV3f8CUX57fDqUIpiRrNqSivkNVwpLFLVfvttO-6-j5NFzsJzlKu5bFirBGAudVLdtz4n0VIBPV-oesuQ2U8U2EaEsgU-YlGfovUxXglYRQRsQ5wc_LpafEfOItwafJwdfXyurjUcQ4Ntr86cRYRehwbIYld_SPmUe65dSsUjDwzQeS7E_Brr0R4WcBuAE4jPWRqfq943JBpxIOAaYbAQJshNeeyivhX7A1LClfVAQF6aoekB1RRIxHWGq0BAU6MgIoX2KG…zRGZLiRCQi43rjEyD2QQG19koPL68136SJRHnwNlSOgzRE6PrsPBHot938ltG2t0fOvqIGZOnJMIrsg43PKKbJHuwrtjHbEbNQjd_UCbA6sblyAZ63Hto12NqXZwXb1g_0XYa9vMVW5ptEveUsaR_aFKwQF_0bvuVfSx2RjoHkVkmBaM67eyQEuuSps9-BqFhvjaLxfDvjm20GXLs7fAZRoe7bU6iJ07iABEyvU6nG9ydt93WameaUpIyOiOB-eitK8nrYF2n3lpaY7N9cIENnPANMzXrEe4fJ0vB0c3wzlmElkwH8xypfWLIqf7y6BNOetEd141nWLWZFzcEXkwlopgO8EZ30dcRZmzkMDuHhxFrErl5Sg-HxdDrhcJV0nPNutVMTy-Tev1yY1qmU5I1kjU91fy9f3jx2kCY0gcUDTFgj1JAgagXz_L4GjJUsT-45__Aisg4aU:1wUsqV:_g37q8BBG71m_rGgBOwVgJXgeAXlIO89Rt59weGl9XM',
          'X-UA-Country-Code' => 'GB',
          'X-UA-Device-Type' => 'desktop'
        }
      end

      def request_proxy
        @request_proxy ||=
          proxy_data
          .dig(:uk, :ipv6)
          .sample
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
    end
  end
end
