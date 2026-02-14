module MessageDecorator
  extend ActiveSupport::Concern

  class_methods do
    def associated
      includes(
        [{ profile: image_association }],
        images_association
      )
    end
  end
end
