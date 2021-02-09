module Discogs
  module Paginated
    private

    def params
      super.merge(pagination_params)
    end

    def pagination_params
      {
        page: (page if @args.page.present?),
        per_page: (limit if @args.limit.present?)
      }.compact
    end

    def page
      (@args.page || 1).to_i
    end

    def limit
      (@args.limit || 20).to_i
    end

    def paginated_data
      {
        page: page,
        total_pages: total_pages,
        albums: albums_data
      }
    end

    def total_pages
      response_data.dig('pagination', 'pages')
    end
  end
end
