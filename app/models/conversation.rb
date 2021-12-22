class Conversation < ApplicationRecord
  belongs_to :profile
  belongs_to :other_profile, class_name: 'Profile'

  has_many :messages, dependent: :destroy

  validates :other_profile_id,
            uniqueness: {
              scope: :profile_id
            }

  class << self
    def associated
      includes(
        other_profile: image_association
      )
    end
  end

  def find_other_profile(profile_id)
    starter?(profile_id) ? other_profile : profile
  end

  private

  def starter?(profile_id)
    profile_id.to_i == self.profile_id
  end
end
