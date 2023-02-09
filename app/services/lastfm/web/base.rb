module LastFM
  module Web
    class Base < LastFM::Base
      private

      def response_data
        @response_data ||=
          Nokogiri::HTML.parse(
            response
          )
      end

      def response
        make_request(
          link
        )
      end

      def make_request(url)
        RestClient::Request.execute(
          request_data(
            url
          )
        )
      rescue RestClient::MovedPermanently => e
        follow_redirect(e)
      rescue RestClient::Found
        nil
      end

      def request_data(url)
        {
          method: :get,
          url:,
          headers:,
          proxy:,
          max_redirects: 0
        }
      end

      def params
        {}
      end

      def cookies
        { lfmanon: '0' }
      end

      def param_formatted(param)
        CGI.escape(super)
      end

      def follow_redirect(redirect)
        make_request(
          redirect_link(
            redirect
          )
        )
      end

      def redirect_link(redirect)
        "https://www.last.fm#{redirect_path(redirect)}"
      end

      def redirect_path(redirect)
        redirect
          .response
          .headers[:location]
      end
    end
  end
end
