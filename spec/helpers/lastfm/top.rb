module Helpers
  module LastFM
    module Top
      class << self
        def artists_data
          {:top=>{:artists=>[{:name=>"Billie Eilish"}, {:name=>"Adele"}, {:name=>"Drake"}, {:name=>"Tyler, the Creator"}, {:name=>"Coldplay"}], :page=>2, :total_pages=>2000}}
        end

        def tags_data
          {:top=>{:page=>2, :tags=>[{:name=>"pop", :taggers_count=>228333}, {:name=>"female vocalists", :taggers_count=>168433}, {:name=>"metal", :taggers_count=>156436}, {:name=>"alternative rock", :taggers_count=>167669}, {:name=>"jazz", :taggers_count=>147718}], :total_pages=>200}}
        end

        def tracks_data
          {:top=>{:page=>2, :total_pages=>2000, :tracks=>[{:artists=>[{:name=>"Doja Cat"}], :listeners_count=>432771, :player_id=>"1", :source_id=>"lastfm", :title=>"Woman"}, {:artists=>[{:name=>"Taylor Swift"}], :listeners_count=>249749, :player_id=>"1", :source_id=>"lastfm", :title=>"All Too Well (10 Minute Version) (Taylor's Version) (From The Vault)"}, {:artists=>[{:name=>"Doja Cat"}], :listeners_count=>444265, :player_id=>"1", :source_id=>"lastfm", :title=>"Need To Know"}, {:artists=>[{:name=>"Billie Eilish"}], :listeners_count=>399796, :player_id=>"1", :source_id=>"lastfm", :title=>"Happier Than Ever"}, {:artists=>[{:name=>"Lil Nas X"}], :listeners_count=>622967, :player_id=>"1", :source_id=>"lastfm", :title=>"Montero (Call Me By Your Name)"}]}}
        end
      end
    end
  end
end
