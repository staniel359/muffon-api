class Service
  class << self
    def call(args = {})
      new(args).call
    end
  end

  def initialize(args = {})
    @args =
      args
      .to_enum
      .to_h
      .symbolize_keys
  end
end
