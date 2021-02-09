module Google
  module Paginated
    PAGE_LIMIT = 10

    private

    def offset
      (page - 1) * PAGE_LIMIT if @args.page.present?
    end

    def page
      (@args.page || 1).to_i
    end
  end
end
