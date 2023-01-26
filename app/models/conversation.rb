class Conversation < ApplicationRecord
  ORDERS = %w[
    created_desc
    created_asc
    updated_desc
    updated_asc
  ].freeze

  include ConversationDecorator

  belongs_to :profile
  belongs_to :other_profile, class_name: 'Profile'

  has_many :messages, dependent: :destroy

  validates :other_profile_id,
            uniqueness: {
              scope: :profile_id
            }
end
