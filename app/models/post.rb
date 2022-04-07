class Post < ApplicationRecord
  include PostDecorator

  has_many_attached :images

  belongs_to :profile

  belongs_to :other_profile,
             class_name: 'Profile',
             optional: true

  belongs_to :community, optional: true

  enum post_type: {
    profile: 0,
    community: 1
  }
end
