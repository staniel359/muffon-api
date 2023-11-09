class Relationship < ApplicationRecord
  EVENT_CALLBACKS = %w[
    created
    deleted
  ].freeze

  include RelationshipDecorator
  include Eventable

  validates :other_profile_id,
            uniqueness: {
              scope: :profile_id
            }

  belongs_to :profile,
             counter_cache: 'following_count'

  belongs_to :other_profile,
             class_name: 'Profile',
             counter_cache: 'followers_count'
end
