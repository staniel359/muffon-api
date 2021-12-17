class ProfilePost < ApplicationRecord
  belongs_to :profile
  belongs_to :other_profile, class_name: 'Profile'

  has_many_attached :images

  class << self
    def for_feed
      where(
        'profile_id = other_profile_id'
      )
    end

    def associated
      includes(
        [profile: image_association],
        images_association
      )
    end
  end
end
