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

  belongs_to :profile
  belongs_to :other_profile, class_name: 'Profile'

  has_many :messages, dependent: :delete_all

  validates :other_profile_id,
            uniqueness: {
              scope: :profile_id
            }
end
