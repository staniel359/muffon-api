class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :profile

  has_many_attached :images
end
