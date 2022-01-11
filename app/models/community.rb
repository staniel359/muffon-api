class Community < ApplicationRecord
  validates :title,
            presence: true,
            uniqueness: true

  belongs_to :creator,
             class_name: 'Profile',
             foreign_key: :profile_id,
             inverse_of: :own_communities

  has_one_attached :image

  has_many :posts, dependent: :destroy

  has_many :memberships, dependent: :destroy

  has_many :members,
           through: :memberships,
           source: :profile

  class << self
    def associated
      includes(
        image_association,
        [creator: image_association]
      )
    end
  end
end
