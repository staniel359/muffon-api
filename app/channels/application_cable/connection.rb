module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :profile

    def connect
      return unless reject_unauthorized_connection?

      reject_unauthorized_connection
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

    def reject_unauthorized_connection?
      !valid_token?
    end

    def valid_token?
      Muffon::Token::Validator.call(
        token:
      )
    end
  end
end
