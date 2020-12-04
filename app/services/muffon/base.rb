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

    def handlers
      Muffon::Errors.handlers
    end

    def global
      @global ||= Redis.new
    end
  end
end
