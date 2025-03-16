class Service
  class << self
    def call(args = {})
      new(args).call
    end
  end

  def initialize(args = {})
    @args = args
  end

  private

  def not_all_args?
    primary_args.any?(
      &:blank?
    )
  end

  def primary_args
    []
  end

  def no_data?
    false
  end

  def forbidden?
    false
  end

  def client_version
    Gem::Version.new(
      @args[:version]
    )
  end
end
