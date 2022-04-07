module PostDecorator
  module ClassMethods
    def associated
      includes(
        [profile: image_association],
        images_association
      )
    end
  end

  def self.included(base)
    base.extend ClassMethods
  end
end
