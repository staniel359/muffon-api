module Google
  class Search < Muffon::Base
    include Google::Paginated
    PAGES_LIMIT = 10

    def call
      return handlers.bad_request if not_all_args?
      return handlers.not_found if no_data?

      data
    end

    private

    def primary_args
      [@args.query, @args.scope]
    end

    def no_data?
      response_data['items'].blank?
    end

    def response_data
      @response_data ||= JSON.parse(response)
    end

    def response
      RestClient.get(link, headers)
    end

    def link
      'https://www.googleapis.com/customsearch/v1/siterestrict'
    end

    def headers
      { params: params }
    end

    def params
      {
        key: api_key,
        q: @args.query,
        cx: scope_id,
        start: (offset if @args.page.present?)
      }.compact
    end

    def api_key
      secrets.google[:api_key]
    end

    def scope_id
      secrets.google.dig(:scopes, @args.scope.to_sym)
    end

    def data
      { search: search_data }
    end

    def search_data
      {
        page: page,
        total_pages: [total_pages, PAGES_LIMIT].min,
        results: response_data['items']
      }
    end

    def total_items_count
      response_data.dig(
        'queries', 'request', 0, 'totalResults'
      ).to_i
    end
  end
end
