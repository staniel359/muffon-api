module Muffon
  class Error < StandardError
    class BadRequestError < Muffon::Error
    end

    class NotFoundError < Muffon::Error
    end

    class ForbiddenError < Muffon::Error
    end
  end
end
