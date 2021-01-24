module Spotify
  module Paginated
    private

    def params
      super.merge(pagination_params)
    end

    def pagination_params
      { limit: limit, offset: offset }
    end

    def limit
      (@args.limit || 20).to_i
    end

    def offset
      (page - 1) * limit
    end

    def page
      (@args.page || 1).to_i
    end

    def total_pages
      total_items.fdiv(limit).ceil
    end
  end
end
