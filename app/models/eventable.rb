module Eventable
  extend ActiveSupport::Concern

  included do
    after_create_commit :handle_after_create_commit

    after_update_commit :handle_after_update_commit

    before_destroy :handle_before_destroy

    has_many :events,
             as: :eventable,
             dependent: nil
  end

  private

  def handle_after_create_commit
    add_created_event
  end

  def handle_after_update_commit
    add_updated_event
  end

  def handle_before_destroy
    add_deleted_event
  end

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
    event_callbacks.include?('created') &&
      save_event?
  end

  def save_event?
    model_profile
      .save_activity_history?
  end

  def model_profile
    case self.class.name
    when 'Profile'
      self
    when 'Community'
      creator
    when 'PlaylistTrack'
      playlist.profile
    else
      profile
    end
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
    event_callbacks.include?('updated') &&
      save_event? &&
      updated?
  end

  def updated?
    event_attributes.any? do |attribute|
      attribute.in?(changed)
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
    event_callbacks.include?('deleted') &&
      save_event?
  end
end
