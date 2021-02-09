module SoundCloud
  module Paginated
    private

    def limit
      (@args.limit || 20).to_i
    end

    def offset
      (page - 1) * limit
    end

    def page
      (@args.page || 1).to_i
    end
  end
end
