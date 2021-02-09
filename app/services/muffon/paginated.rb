module Muffon
  module Paginated
    private

    def page
      (@args.page || 1).to_i
    end

    def offset
      (page - 1) * limit
    end

    def limit
      (@args.limit || page_limit).to_i
    end

    def page_limit
      20
    end

    def total_pages
      total_items_count.fdiv(limit).ceil
    end

    def total_items_count
      collection_list.size
    end

    def paginated_collection
      collection_list.slice(offset, limit).to_a
    end
  end
end
