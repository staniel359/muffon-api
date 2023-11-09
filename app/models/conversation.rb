class Conversation < ApplicationRecord
  ORDERS = %w[
    created_desc
    created_asc
    updated_desc
    updated_asc
  ].freeze
  EVENT_CALLBACKS = %w[
    created
  ].freeze

  include ConversationDecorator
  include Eventable

  validates :other_profile_id,
            uniqueness: {
              scope: :profile_id
            }

  before_destroy :delete_data

  belongs_to :profile
  belongs_to :other_profile, class_name: 'Profile'

  has_many :messages, dependent: :delete_all

  private

  def delete_data
    delete_images
  end

  def delete_images
    messages.find_each do |m|
      m.images.purge_later
    end
  end
end
