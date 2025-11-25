module GitHub
  class Releases < Muffon::Base
    BASE_LINK =
      'https://api.github.com/repos/staniel359/muffon/releases'.freeze
    PAGE_LIMIT = 100

    def call
      data
    end

    private

    def data
      paginated_data(
        collection_name: 'releases',
        raw_collection:
          raw_collection_filtered,
        page:,
        limit:,
        is_fractioned: true
      )
    end

    def raw_collection_filtered
      response_data.reject do |raw_item_data|
        raw_item_data['published_at'].blank?
      end
    end

    def link
      BASE_LINK
    end

    def headers
      { 'Authorization' => "Bearer #{token}" }
    end

    def token
      credentials.dig(
        :github,
        :token
      )
    end

    def params
      { per_page: PAGE_LIMIT }
    end

    def collection_item_data_formatted(release)
      GitHub::Releases::Release.call(
        release:
      )
    end
  end
end
