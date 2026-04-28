module ApplicationCable
  class Channel < ActionCable::Channel::Base
    private

    def profile_id
      profile_record.id
    end

    def token
      profile_record.token
    end
  end
end
