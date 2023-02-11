class Membership < ApplicationRecord
  EVENT_CALLBACKS = %w[
    created
    deleted
  ].freeze

  include MembershipDecorator
  include Eventable

  belongs_to :profile
  belongs_to :community,
             counter_cache: 'members_count'

  validates :community_id,
            uniqueness: {
              scope: :profile_id
            }
end
