module Deezer
  module Paginated
    private

    def params
      super.merge(pagination_params)
    end

    def pagination_params
      {
        limit: limit,
        index: offset
      }
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

    def paginated_data
      {
        page: page,
        total_pages: total_pages,
        collection_name.to_sym => collection_data
      }
    end

    def total_pages
      response_data['total'].fdiv(limit).ceil
    end

    def collection_data
      collection_list.map { |a| collection_item_data(a) }
    end

    def collection_list
      response_data['data']
    end
  end
end
