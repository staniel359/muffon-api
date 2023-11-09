class Event < ApplicationRecord
  ORDERS = %w[
    created_desc
    created_asc
  ].freeze

  validates :event_type, presence: true

  enum event_type: {
    created: 0,
    updated: 1,
    deleted: 2
  }

  belongs_to :eventable, polymorphic: true

  belongs_to :profile
  belongs_to :other_profile,
             class_name: 'Profile',
             optional: true
end
