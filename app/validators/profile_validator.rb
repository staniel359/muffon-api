module ProfileValidator
  extend ActiveSupport::Concern

  included do
    validates :email,
              presence: true,
              uniqueness: true,
              format: {
                with: URI::MailTo::EMAIL_REGEXP
              }

    validates :password,
              presence: true,
              length: { minimum: 6 },
              on: :create

    validates :password,
              allow_blank: true,
              length: { minimum: 6 },
              on: :update

    validates :nickname,
              presence: true,
              uniqueness: true,
              length: { maximum: 30 }
  end
end
