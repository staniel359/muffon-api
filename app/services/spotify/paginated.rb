module Spotify
  module Paginated
    include Muffon::Paginated

    private

    def params
      super.merge(pagination_params)
    end

    def pagination_params
      { limit: limit, offset: offset }
    end
  end
end
