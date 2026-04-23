module Genius
  class Base < Muffon::Base
    SOURCE_NAME = 'genius'.freeze
    BASE_LINK = 'https://genius.com/api'.freeze

    private

    def proxy
      proxy_data
        .dig(:uk, :ipv6)
        .sample
    end

    def next_page
      page.to_i + 1
    end
  end
end
