module Spotify
  module Paginated
    include Muffon::Utils::Paginated

    private

    def params
      super.merge(pagination_params)
    end

    def pagination_params
      { limit: limit, offset: offset }
    end
  end
end
