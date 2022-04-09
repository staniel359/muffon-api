class Post < ApplicationRecord
  belongs_to :profile
  belongs_to :other_profile, class_name: 'Profile', optional: true
  belongs_to :community, optional: true

  has_many_attached :images

  class << self
    def associated
      includes(
        [profile: image_association],
        images_association
      )
    end
  end
end
