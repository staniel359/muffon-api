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
      { params: params.compact }
    end

    def params
      {
        key: api_key,
        q: @args.query,
        cx: scope_id,
        start: (offset if @args.page.present?),
        fields: fields
      }
    end

    def api_key
      secrets.google[:api_key]
    end

    def scope_id
      secrets.google.dig(:scopes, @args.scope.to_sym)
    end

    def fields
      'queries(request(totalResults)),'\
        'items(pagemap(metatags(og:site_name,'\
        'og:url,og:title),cse_image))'
    end

    def data
      { search: search_data }
    end

    def search_data
      {
        page: page,
        total_pages: [total_pages, PAGES_LIMIT].min,
        results: results_data
      }
    end

    def total_items_count
      response_data.dig(
        'queries', 'request', 0, 'totalResults'
      ).to_i
    end

    def results_data
      results_list.map { |r| result_data(r) }
    end

    def results_list
      response_data['items']
    end

    def result_data(result)
      {
        site_name: opengraph_data(result, 'site_name'),
        title: opengraph_data(result, 'title'),
        link: opengraph_data(result, 'url'),
        image: result.dig('pagemap', 'cse_image', 0, 'src')
      }
    end

    def opengraph_data(result, name)
      result.dig('pagemap', 'metatags', 0, "og:#{name}")
    end
  end
end
