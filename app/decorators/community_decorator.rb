module CommunityDecorator
  module ClassMethods
    def members_count_desc_ordered
      order(
        members_count: :desc
      )
    end

    def members_count_asc_ordered
      order(
        members_count: :asc
      )
    end

    def joined_desc_ordered
      order(
        'memberships.created_at DESC'
      )
    end

    def joined_asc_ordered
      order(
        'memberships.created_at ASC'
      )
    end

    def associated
      includes(
        image_association,
        [creator: image_association]
      )
    end
  end

  def self.included(base)
    base.extend ClassMethods
  end

  def in_members?(profile_id)
    members
      .find_by(id: profile_id)
      .present?
  end
end
