class Membership < ApplicationRecord
  EVENT_CALLBACKS = %w[
    created
    deleted
  ].freeze

  include MembershipDecorator
  include Eventable

  validates :community_id,
            uniqueness: {
              scope: :profile_id
            }

  belongs_to :profile
  belongs_to :community,
             counter_cache: 'members_count'
end
