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
        token: access_token
      )
    end

    def access_token
      request.params['token']
    end

    def reject_unauthorized_connection?
      !valid_access_token?
    end

    def valid_access_token?
      Muffon::AccessToken::Validator.call(
        access_token:
      )
    end
  end
end
