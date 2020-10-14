module VK
  module Utils
    class Remixsid < VK::Base
      def call
        data
      end

      private

      def data
        post_login
      rescue RestClient::Found => e
        process_redirect(e)
      end

      def post_login
        RestClient.post('login.vk.com', params, extra_data)
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
        body.css("input[name='#{name}']")[0]['value']
      end

      def body
        Nokogiri::HTML.parse(response.body)
      end

      def response
        @response ||= RestClient.get('vk.com')
      end

      def extra_data
        { headers: headers, cookies: response.cookies }
      end

      def headers
        { 'User-Agent' => user_agent }
      end

      def user_agent
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:81.0) '\
          'Gecko/20100101 Firefox/81.0'
      end

      def process_redirect(redirect)
        redirect_response(redirect).cookies['remixsid']
      end

      def redirect_response(redirect)
        RestClient.get(redirect_link(redirect), extra_data)
      end

      def redirect_link(redirect)
        redirect.response.headers[:location]
      end
    end
  end
end
