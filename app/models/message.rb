class Message < ApplicationRecord
  include MessageDecorator
  include SendableDecorator

  has_many_attached :images

  belongs_to :conversation
  belongs_to :profile
end
