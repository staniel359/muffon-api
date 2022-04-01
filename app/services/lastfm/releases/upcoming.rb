module LastFM
  module Releases
    class Upcoming < LastFM::Releases::Base
      SCOPE = 'coming-soon'.freeze
    end
  end
end
