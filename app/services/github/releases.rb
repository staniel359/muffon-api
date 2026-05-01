module GitHub
  class Releases < GitHub::Base
    PAGE_LIMIT = 100

    def call
      data
    end

    private

    def data
      paginated_data(
        collection_name: 'releases',
        raw_collection: raw_collection_filtered,
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

    def request_params
      { per_page: PAGE_LIMIT }
    end

    def collection_item_data_formatted(
      raw_release_data
    )
      GitHub::Releases::Release.call(
        raw_release_data:
      )
    end
  end
end
