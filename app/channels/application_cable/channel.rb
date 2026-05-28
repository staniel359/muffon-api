module ApplicationCable
  class Channel < ActionCable::Channel::Base
    private

    def profile_id
      if profile_record.blank?
        raise "Issue with profile; token: #{access_token}"
      end

      profile_record.id
    end

    def token
      profile_record.token
    end
  end
end
