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
  end
end
