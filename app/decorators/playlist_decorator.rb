module PlaylistDecorator
  module ClassMethods
    def associated
      includes(
        image_association,
        profile: image_association
      )
    end
  end

  def self.included(base)
    base.extend ClassMethods
  end
end
