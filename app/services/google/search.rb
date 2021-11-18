module Google
  class Search < Muffon::Base
    BASE_LINK =
      'https://www.googleapis.com'\
      '/customsearch/v1/siterestrict'.freeze
    COLLECTION_NAME = 'results'.freeze
    FIELDS = <<~FIELDS.freeze
      items(
        pagemap(
          cse_image,
          metatags(
            og:description,
            og:site_name,
            og:title,
            og:url
          )
        )
      ),
      queries(
        request(
          totalResults
        )
      )
    FIELDS
    PAGE_LIMIT = 10
    PAGES_LIMIT = 10
    include Muffon::Utils::Pagination

    private

    def primary_args
      [
        @args[:query],
        @args[:scope]
      ]
    end

    def no_data?
      collection_list.blank?
    end

    def collection_list
      @collection_list ||= response_data['items']
    end

    def response_data
      @response_data ||= JSON.parse(response)
    end

    def response
      RestClient.get(link, headers)
    end

    def link
      BASE_LINK
    end

    def headers
      { params: params }
    end

    def params
      {
        key: api_key,
        q: @args[:query],
        cx: scope_id,
        start: offset,
        fields: fields_formatted
      }
    end

    def api_key
      secrets.google[:api_key]
    end

    def scope_id
      secrets.google.dig(
        :scopes, @args[:scope].to_sym
      )
    end

    def fields_formatted
      FIELDS.scan(/\S/).join
    end

    def data
      { search: paginated_data }
    end

    def total_pages_count
      [super, PAGES_LIMIT].min
    end

    def total_items_count
      response_data.dig(
        'queries', 'request', 0, 'totalResults'
      ).to_i
    end

    def limit
      PAGE_LIMIT
    end

    def collection_item_data_formatted(result)
      Google::Search::Result.call(
        result: result
      )
    end
  end
end
