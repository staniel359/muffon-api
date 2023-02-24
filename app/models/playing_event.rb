class PlayingEvent < ApplicationRecord
  ORDERS = %w[
    created_desc
    created_asc
  ].freeze

  belongs_to :profile

  validates :data, presence: true
end
