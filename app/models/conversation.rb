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

  def find_other_profile(profile_id)
    if starter?(profile_id)
      other_profile
    else
      profile
    end
  end

  private

  def starter?(profile_id)
    profile_id.to_i ==
      self.profile_id
  end
end
