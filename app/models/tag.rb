class Tag < ApplicationRecord
  ORDERS = %w[
    library_count_desc
    library_count_asc
  ].freeze

  validates :name, presence: true

  validates :name_downcase,
            presence: true,
            uniqueness: true

  class << self
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

    def with_names(
      names
    )
      names_formatted =
        names.map do |name|
          name
            .strip
            .downcase
        end

      where(
        name_downcase: names_formatted
      )
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
