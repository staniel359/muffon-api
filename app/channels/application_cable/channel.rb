module ApplicationCable
  class Channel < ActionCable::Channel::Base
    private

    def profile_id
      if profile_record.present?
        profile_record.id
      else
        raise "Issue with profile; token: #{access_token}"
      end
    end

    def token
      profile_record.token
    end
  end
end
