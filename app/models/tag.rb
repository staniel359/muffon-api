class Tag < ApplicationRecord
  include TagDecorator

  validates :name,
            presence: true,
            uniqueness: true
end
