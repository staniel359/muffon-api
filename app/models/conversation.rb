class Conversation < ApplicationRecord
  ORDERS = %w[
    created_desc
    created_asc
    updated_desc
    updated_asc
  ].freeze
  EVENT_CALLBACKS = %w[
    created
  ].freeze

  include ConversationDecorator
  include Eventable

  validates :other_profile_id,
            uniqueness: {
              scope: :profile_id
            }

  has_many :messages,
           dependent: :destroy

  belongs_to :profile

  belongs_to :other_profile,
             class_name: 'Profile'
end
