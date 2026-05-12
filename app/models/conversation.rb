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

  include Eventable

  validates :other_profile_id,
            uniqueness: {
              scope: :profile_id
            }

  has_many :messages, dependent: :destroy

  belongs_to :profile

  belongs_to :other_profile, class_name: 'Profile'

  class << self
    def with_relations
      includes(
        other_profile: image_association
      )
    end

    def with_or_of_profile(
      profile_id
    )
      where(
        'profile_id = :id OR other_profile_id = :id',
        id: profile_id
      )
    end
  end

  def detect_other_profile(
    profile_id:
  )
    if starter?(profile_id:)
      other_profile
    else
      profile
    end
  end

  private

  def starter?(
    profile_id:
  )
    self.profile_id == profile_id.to_i
  end

  def eventable_data
    { other_profile: other_profile_data }
  end

  def other_profile_data
    {
      id: other_profile_id,
      nickname: other_profile.nickname
    }
  end
end
