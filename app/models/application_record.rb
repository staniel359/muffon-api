class ApplicationRecord < ActiveRecord::Base
  TRANSACTION_RETRIES_COUNT = 1

  self.abstract_class = true

  include Muffon::Utils::Errors
  include Muffon::Utils::Image::Processing
  include ApplicationRecordDecorator

  class << self
    def with_cache_clearance_and_retry_on_error(&)
      yield
    rescue ActiveRecord::RecordNotUnique, ActiveRecord::RecordInvalid => e
      clear_cache

      @count ||= 0

      if @count < TRANSACTION_RETRIES_COUNT
        @count += 1

        sleep 1

        retry
      else
        @count = 0

        raise e
      end
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

  private

  def update_artist_tags
    artist.update_tags
  end

  def test?
    Rails.env.test?
  end
end
