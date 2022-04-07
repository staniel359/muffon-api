module ConversationDecorator
  module ClassMethods
    def associated
      includes(
        other_profile: image_association
      )
    end
  end

  def self.included(base)
    base.extend ClassMethods
  end
end
