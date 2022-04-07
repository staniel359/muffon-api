class Community < ApplicationRecord
  include CommunityDecorator

  has_one_attached :image

  belongs_to :creator,
             class_name: 'Profile',
             foreign_key: :profile_id,
             inverse_of: :own_communities

  has_many :posts, dependent: :destroy

  has_many :memberships, dependent: :destroy

  has_many :members,
           through: :memberships,
           source: :profile

  validates :title,
            presence: true,
            uniqueness: true
end
