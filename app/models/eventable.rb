module Eventable
  extend ActiveSupport::Concern

  included do
    after_create :add_created_event
    before_update :add_updated_event
    before_destroy :add_deleted_event

    has_many :events,
             as: :eventable,
             dependent: nil
  end

  private

  def add_created_event
    return unless add_created_event?

    events.create!(
      event_type: 'created',
      profile_id:,
      other_profile_id:
        other_profile_id_optional,
      eventable_data:
    )
  end

  def other_profile_id_optional
    try(:other_profile_id)
  end

  def add_created_event?
    event_callbacks.include?(
      'created'
    )
  end

  def event_callbacks
    self.class::EVENT_CALLBACKS
  end

  def add_updated_event
    return unless add_updated_event?

    events.create!(
      event_type: 'updated',
      profile_id:,
      eventable_data:,
      updated_data:
    )
  end

  def add_updated_event?
    event_callbacks.include?(
      'updated'
    ) && updated?
  end

  def updated?
    event_attributes.any? do |a|
      a.in?(changed)
    end
  end

  def event_attributes
    self.class::EVENT_ATTRIBUTES
  end

  def updated_data
    changes.slice(
      *event_attributes
    )
  end

  def add_deleted_event
    return unless add_deleted_event?

    events.create!(
      event_type: 'deleted',
      profile_id:,
      other_profile_id:
        other_profile_id_optional,
      eventable_data:
    )
  end

  def add_deleted_event?
    event_callbacks.include?(
      'deleted'
    )
  end
end
