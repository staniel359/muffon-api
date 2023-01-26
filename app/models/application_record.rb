class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  include Muffon::Utils::ErrorHandlers
  include Muffon::Utils::Image::Processing
  include ApplicationRecordDecorator
end
