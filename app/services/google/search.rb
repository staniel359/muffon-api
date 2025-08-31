module Google
  class Search < Muffon::Base
    COLLECTION_NAME = 'results'.freeze
    PAGE_LIMIT = 10
    PAGES_LIMIT = 10
    BASE_LINK =
      'https://www.googleapis.com' \
      '/customsearch/v1/siterestrict'.freeze
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

    include Muffon::Utils::Pagination

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

    def collection_list
      response_data['items'] || []
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
      FIELDS.scan(/\S/).join
    end

    def data
      { search: paginated_data }
    end

    def total_pages_count
      return if total_items_count.zero?

      [
        super,
        PAGES_LIMIT
      ].min
    end

    def total_items_count
      response_data.dig(
        'queries', 'request',
        0, 'totalResults'
      ).to_i
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
