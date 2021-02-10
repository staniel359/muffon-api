module Bandcamp
  module Paginated
    private

    def paginated_data
      {
        page: page,
        total_pages: total_pages,
        collection_name.to_sym => send("#{collection_name}_data")
      }
    end

    def page
      (@args.page || 1).to_i
    end

    def total_pages
      collection_list.size.fdiv(limit).ceil
    end

    def limit
      (@args.limit || 20).to_i
    end

    def paginated_collection
      collection_list.slice(offset, limit).to_a
    end

    def offset
      (page - 1) * limit
    end
  end
end
