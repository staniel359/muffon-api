module VK
  class Base < Muffon::Base
    private

    def response
      RestClient.post(link, params, headers)
    end
  end
end
