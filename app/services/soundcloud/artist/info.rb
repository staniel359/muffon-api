module SoundCloud
  module Artist
    class Info < SoundCloud::Artist::Base
      include SoundCloud::Mixins::Artist
    end
  end
end
