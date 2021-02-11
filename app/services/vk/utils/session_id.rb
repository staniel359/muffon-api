module VK
  module Utils
    class SessionId < VK::Base
      def call
        response
      rescue RestClient::Found => e
        process_redirect(e)
      end

      private

      def link
        'https://login.vk.com'
      end

      def params
        {
          act: 'login',
          role: 'al_frame',
          expire: '',
          ip_h: selector_data('ip_h'),
          lg_h: selector_data('lg_h'),
          email: secrets.vk[:email],
          pass: secrets.vk[:password]
        }
      end

      def selector_data(name)
        base_response_data.css("input[name='#{name}']")[0]['value']
      end

      def base_response_data
        Nokogiri::HTML.parse(base_response)
      end

      def base_response
        @base_response ||= RestClient.get('https://vk.com')
      end

      def headers
        {
          cookies: base_response.cookies,
          'User-Agent' => user_agent
        }
      end

      def user_agent
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:81.0) '\
          'Gecko/20100101 Firefox/81.0'
      end

      def process_redirect(redirect)
        redirect_response(redirect).cookies['remixsid']
      end

      def redirect_response(redirect)
        RestClient.get(redirect_link(redirect), headers)
      end

      def redirect_link(redirect)
        redirect.response.headers[:location]
      end
    end
  end
end
