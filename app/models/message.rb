class Message < ApplicationRecord
  include Imageable

  has_many_attached :images

  belongs_to :conversation

  belongs_to :profile

  class << self
    def with_relations
      includes(
        profile: image_association,
        **images_association
      )
    end
  end
end
