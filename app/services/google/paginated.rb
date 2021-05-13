module Google
  module Paginated
    include Muffon::Utils::Paginated
    PAGE_LIMIT = 10

    private

    def limit
      PAGE_LIMIT
    end
  end
end
