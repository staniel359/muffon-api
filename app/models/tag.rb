class Tag < ApplicationRecord
  include TagDecorator

  validates :name,
            presence: true

  validates :name_downcase,
            presence: true,
            uniqueness: true
end
