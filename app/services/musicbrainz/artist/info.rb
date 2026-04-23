module MusicBrainz
  module Artist
    class Info < MusicBrainz::Artist::Base
      include MusicBrainz::Mixins::Artist
    end
  end
end
