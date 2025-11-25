class Tag < ApplicationRecord
  ORDERS = %w[
    library_count_desc
    library_count_asc
  ].freeze

  include TagDecorator

  validates :name,
            presence: true

  validates :name_downcase,
            presence: true,
            uniqueness: true
end
