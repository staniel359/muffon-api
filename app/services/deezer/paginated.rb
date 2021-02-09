module Deezer
  module Paginated
    include Muffon::Paginated

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

    def paginated_data
      {
        page: page,
        total_pages: total_pages,
        collection_name.to_sym => collection_data
      }
    end

    def total_items_count
      response_data['total']
    end

    def collection_data
      collection_list.map { |a| collection_item_data(a) }
    end

    def collection_list
      response_data['data']
    end
  end
end
