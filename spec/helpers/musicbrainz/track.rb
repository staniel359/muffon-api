module Helpers
  module MusicBrainz
    module Track
      class << self
        def info_data
          {:track=>{:album=>{:model=>"album", :source=>{:id=>"352cac7d-a33f-4878-8ecb-960bcd9cf125", :name=>"musicbrainz"}, :title=>"Hounds of Love"}, :artist=>{:name=>"Kate Bush"}, :artists=>[{:name=>"Kate Bush", :source=>{:id=>"4b585938-f271-45e2-b19a-91c634b5e396", :name=>"musicbrainz"}}], :image=>{:extrasmall=>"https://coverartarchive.org/release/352cac7d-a33f-4878-8ecb-960bcd9cf125/front-250", :large=>"https://coverartarchive.org/release/352cac7d-a33f-4878-8ecb-960bcd9cf125/front-500", :medium=>"https://coverartarchive.org/release/352cac7d-a33f-4878-8ecb-960bcd9cf125/front-500", :original=>"https://coverartarchive.org/release/352cac7d-a33f-4878-8ecb-960bcd9cf125/front-1200", :small=>"https://coverartarchive.org/release/352cac7d-a33f-4878-8ecb-960bcd9cf125/front-250"}, :player_id=>"1", :release_date=>"1985-07-30", :source=>{:id=>"6029d549-5858-4936-9156-b90770d2ae92", :name=>"musicbrainz"}, :tags=>[{:name=>"alternative"}, {:name=>"alternative pop/rock"}, {:name=>"alternative/indie rock"}, {:name=>"art pop"}, {:name=>"art rock"}], :title=>"Running Up That Hill (A Deal With God)", :with_more=>{:tags=>true}}}
        end

        def tags_data
          {:track=>{:tags=>[{:name=>"alternative"}, {:name=>"alternative pop/rock"}, {:name=>"alternative/indie rock"}, {:name=>"art pop"}, {:name=>"art rock"}, {:name=>"college rock"}, {:name=>"j-pop"}, {:name=>"pop"}, {:name=>"pop rock"}, {:name=>"pop/rock"}, {:name=>"progressive rock"}, {:name=>"rock"}, {:name=>"synth-pop"}]}}
        end
      end
    end
  end
end
