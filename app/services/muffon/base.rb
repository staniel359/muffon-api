module Muffon
  class Base < Service
    include Muffon::Utils::Errors
    include Muffon::Utils::Base
    include Muffon::Utils::Request
    include Muffon::Utils::Profile
    include Muffon::Utils::Formatters
    include Muffon::Utils::Global
    include Muffon::Utils::More

    private

    def check_args
      return unless args_missing?

      raise(
        bad_request_error,
        "Args missing: #{missing_args}"
      )
    end

    def args_missing?
      missing_args.any?
    end

    def missing_args
      required_args - present_args
    end

    def present_args
      @args
        .compact_blank
        .keys
    end

    def required_args
      []
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
