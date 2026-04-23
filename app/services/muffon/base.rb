module Muffon
  class Base < Service
    include Muffon::Mixins::Base
    include Muffon::Mixins::Errors
    include Muffon::Mixins::Request
    include Muffon::Mixins::Profile
    include Muffon::Mixins::Formatters
    include Muffon::Mixins::Pagination

    private

    def check_args
      if args_missing?
        raise(
          bad_request_error,
          "Args missing: #{missing_args_string}"
        )
      elsif wrong_args?
        raise(
          bad_request_error,
          'Wrong args'
        )
      end
    end

    def args_missing?
      missing_args.any?
    end

    def missing_args
      required_args - @args.keys
    end

    def required_args
      []
    end

    def missing_args_string
      missing_args.join(', ')
    end

    def wrong_args?
      false
    end

    def check_if_not_found
      return unless not_found?

      raise not_found_error
    end

    def not_found?
      false
    end

    def check_if_forbidden
      return unless forbidden?

      raise forbidden_error
    end

    def forbidden?
      false
    end
  end
end
