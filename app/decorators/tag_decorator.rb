module TagDecorator
  extend ActiveSupport::Concern

  class_methods do
    def with_name(name)
      name_formatted = name.strip

      where(
        name_downcase: name_formatted.downcase
      ).first_or_create(
        name: name_formatted
      )
    rescue ActiveRecord::RecordNotUnique
      clear_cache && retry
    end
  end
end
