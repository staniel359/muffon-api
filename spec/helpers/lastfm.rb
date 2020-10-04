module Helpers
  module LastFM
    RANDOM_STRING = 'wejlhg239gh23'.freeze

    class << self
      def artist_data
        {:artist=>{:name=>"Wild Nothing", :mbid=>"a181595e-5b84-4439-a5f4-f548ddfb64df", :listeners_count=>544406, :plays_count=>18874876, :description=>"Wild Nothing is the solo project of Virginia-born Jack Tatum. Tatum began recording under the moniker Wild Nothing in the summer of 2009 in Blacksburg, Virginia. Upon gathering attention in indie music circles, he was signed with the Captured Tracks record label and began touring with a band. His debut full-length, \"Gemini,\" was released in spring 2010 to acclaim from Pitchfork Media and the music editors at Amazon.com. A follow-up album called \"Nocturne\" was released in 2012. His second EP \"Empty Estate\" was released in May 2013. Tatum's third LP entitled \"Life of Pause\" was released on February 19, 2016.", :tags=>["dream pop", "shoegaze", "indie pop", "indie", "seen live"], :similar_artists=>["Craft Spells", "Beach Fossils", "DIIV", "Small Black", "Blouse"]}}
      end

      def error_data
        { error: 'Not found.' }
      end
    end
  end
end
