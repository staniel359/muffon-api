module YouTube
  module Paginated
    private

    def limit
      (@args.limit || 20).to_i
    end
  end
end
