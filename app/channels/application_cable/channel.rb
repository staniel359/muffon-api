module ApplicationCable
  class Channel < ActionCable::Channel::Base
    private

    def profile_id
      profile.id
    end

    def token
      profile.token
    end
  end
end
