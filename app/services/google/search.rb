module Google
  class Search < Muffon::Base
    BASE_LINK =
      'https://www.googleapis.com/customsearch/v1/siterestrict'.freeze
    PAGE_LIMIT = 10
    PAGES_LIMIT = 10
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

    def call
      check_args

      data
    rescue Faraday::BadRequestError
      raise bad_request_error
    end

    private

    def required_args
      %i[
        query
        scope
      ]
    end

    def data
      { search: search_data }
    end

    def search_data
      paginated_data(
        collection_name: 'results',
        raw_collection:,
        page:,
        limit:,
        pages_count: PAGES_LIMIT
      )
    end

    def raw_collection
      response_data['items']
    end

    def link
      BASE_LINK
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
      credentials.dig(
        :google,
        :api_key
      )
    end

    def scope_id
      credentials.dig(
        :google,
        :scopes,
        @args[:scope].to_sym
      )
    end

    def fields_formatted
      FIELDS
        .scan(/\S/)
        .join
    end

    def items_count
      response_data
        .dig(
          'queries',
          'request',
          0,
          'totalResults'
        )
        .to_i
    end

    def limit
      PAGE_LIMIT
    end

    def collection_item_data_formatted(result)
      Google::Search::Result.call(
        result:
      )
    end
  end
end
