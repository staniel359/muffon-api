class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :profile

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
