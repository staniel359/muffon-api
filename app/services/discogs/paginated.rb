module Discogs
  module Paginated
    private

    def params
      super.merge(pagination_params)
    end

    def pagination_params
      {
        page: @args.page,
        per_page: @args.limit
      }
    end

    def paginated_data
      {
        page: page,
        total_pages: total_pages,
        albums: albums_data
      }
    end

    def page
      pagination['page']
    end

    def pagination
      response_data['pagination']
    end

    def total_pages
      pagination['pages']
    end
  end
end
