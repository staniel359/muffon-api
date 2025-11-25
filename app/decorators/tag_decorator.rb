module TagDecorator
  extend ActiveSupport::Concern

  class_methods do
    def with_name(
      name
    )
      with_cache_clearance_and_retry_on_error do
        name_formatted = name.strip

        where(
          name_downcase:
            name_formatted.downcase
        )
          .first_or_create!(
            name: name_formatted
          )
      end
    end

    def library_count_desc_ordered
      order(
        'tags_grouped.library_count DESC',
        name: :asc
      )
    end

    def library_count_asc_ordered
      order(
        'tags_grouped.library_count ASC',
        name: :asc
      )
    end
  end
end
