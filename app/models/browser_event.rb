class BrowserEvent < ApplicationRecord
  ORDERS = %w[
    created_desc
    created_asc
  ].freeze

  validates :data,
            presence: true

  belongs_to :profile
end
