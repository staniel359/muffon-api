module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :profile

    def connect
      if reject?
        reject_unauthorized_connection
      end
    end

    def disconnect; end

    private

    def profile
      Profile.find_by(
        token:
      )
    end

    def token
      request.params['token']
    end

    def reject?
      !valid_token?
    end

    def valid_token?
      Muffon::Token::Validator.call(
        token:
      )
    end
  end
end
