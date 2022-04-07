module CommunityDecorator
  module ClassMethods
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
end
