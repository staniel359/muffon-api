class ApplicationRecord < ActiveRecord::Base
  TRANSACTION_RETRIES_COUNT = 3
  TRANSACTION_RETRIES_INTERVAL = 1

  self.abstract_class = true

  include Muffon::Utils::Errors
  include Muffon::Mixins::Processing::Image
  include ApplicationRecordDecorator

  class << self
    def with_cache_clearance_and_retry_on_error(retries_made: 0, &)
      yield
    rescue ActiveRecord::RecordNotUnique, ActiveRecord::RecordInvalid => e
      clear_cache

      is_retry = retries_made < TRANSACTION_RETRIES_COUNT

      raise e unless is_retry

      sleep TRANSACTION_RETRIES_INTERVAL

      with_cache_clearance_and_retry_on_error(
        retries_made: retries_made + 1,
        &
      )
    end

    def test?
      Rails.env.test?
    end

    private

    def clear_cache
      ActiveRecord::Base
        .connection
        .clear_query_cache
    end
  end

  def listeners_count
    return 0 if test?

    super
  end

  private

  def test?
    Rails.env.test?
  end
end
