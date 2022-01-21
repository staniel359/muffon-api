module Worker
  class Base
    include Sidekiq::Worker

    private

    def args_formatted(args)
      JSON.parse(
        args
      ).deep_symbolize_keys
    end
  end
end
