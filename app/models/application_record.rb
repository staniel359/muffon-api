class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def image_data
    return {} if image.blank?

    {
      original: original_url,
      large: variant_url(600),
      medium: variant_url(300),
      small: variant_url(100),
      extrasmall: variant_url(50)
    }
  end

  private

  def original_url
    ActiveStorage::Current.set(host: host) do
      image.url
    end
  end

  def host
    Rails.application.credentials.url
  end

  def variant_url(size)
    ActiveStorage::Current.set(host: host) do
      image.variant(
        resize_to_limit: [size, size]
      ).processed.url
    end
  end
end
