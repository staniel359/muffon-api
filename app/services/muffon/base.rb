module Muffon
  class Base
    def initialize(args)
      @args = OpenStruct.new(args)
    end

    def self.call(args)
      new(args).call
    end

    private

    def secrets
      Rails.application.credentials
    end

    def not_found_error
      { error: { code: 404, text: 'Not found.' } }
    end
  end
end
