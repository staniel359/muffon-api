module GitHub
  class Releases < Muffon::Base
    BASE_LINK =
      'https://api.github.com/repos' \
      '/staniel359/muffon/releases'.freeze
    COLLECTION_NAME = 'releases'.freeze
    TOTAL_LIMIT = 100

    include Muffon::Utils::Pagination

    private

    def link
      BASE_LINK
    end

    def headers
      {
        'Authorization' => "Bearer #{token}",
        params:
      }
    end

    def token
      secrets.github[:token]
    end

    def params
      { per_page: TOTAL_LIMIT }
    end

    def collection_list
      collection_paginated(
        response_data
      )
    end

    def collection_count
      response_data.size
    end

    def collection_item_data_formatted(release)
      GitHub::Releases::Release.call(
        release:
      )
    end

    alias data paginated_data
  end
end
