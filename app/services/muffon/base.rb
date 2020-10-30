module Muffon
  class Base
    def initialize(args = {})
      @args = OpenStruct.new(args)
    end

    class << self
      def call(args = {})
        new(args).call
      end
    end

    private

    def secrets
      Rails.application.credentials
    end

    def not_all_args?
      primary_args.any?(&:blank?)
    end

    def bad_request_error
      { error: { code: 400, text: 'Bad request' } }
    end

    def not_found_error
      { error: { code: 404, text: 'Not found' } }
    end

    def timeout_error
      { error: { code: 504, text: 'Gateway Timeout' } }
    end

    def global
      @global ||= Redis.new
    end
  end
end
