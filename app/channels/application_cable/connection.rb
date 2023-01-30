module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :profile

    def connect
      reject_unauthorized_connection if reject?
    end

    def disconnect; end

    private

    def reject?
      !valid_token?
    end

    def valid_token?
      Muffon::Token::Validator.call(
        token:
      )
    end

    def token
      request.params['token']
    end

    def profile
      Profile.find_by(
        token:
      )
    end
  end
end
