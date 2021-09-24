module Muffon
  class Base
    ERRORS = Muffon::Utils::Errors
    include Muffon::Utils::ErrorHandlers
    include Muffon::Utils::Formatters
    include Muffon::Utils::More

    class << self
      def call(args = {})
        new(args).call
      rescue *ERRORS.list => e
        ERRORS.handle(e.class)
      end
    end

    def initialize(args = {})
      @args = OpenStruct.new(args)
    end

    def call
      return bad_request if not_all_args?
      return not_found if no_data?

      data
    end

    private

    def not_all_args?
      primary_args.any?(&:blank?)
    end

    def primary_args
      []
    end

    def no_data?
      false
    end

    def secrets
      Rails.application.credentials
    end

    def muffon_data
      {
        library_id: library_id,
        listened_id: listened_id,
        bookmark_id: bookmark_id,
        favorite_id: favorite_id
      }.compact
    end
  end
end
