module PostCommentDecorator
  extend ActiveSupport::Concern

  class_methods do
    def associated
      includes(
        [{ profile: image_association }],
        [{ community: image_association }],
        images_association
      )
    end
  end

  private

  def eventable_data
    {
      id:,
      text:
    }
  end
end
