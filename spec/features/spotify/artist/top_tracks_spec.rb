require 'rails_helper'

RSpec.describe Spotify::Artist::TopTracks do
  subject { described_class }

  describe 'successful processing' do
    context 'when artist_id present' do
      let(:output) do
        VCR.use_cassette 'spotify/artist/top_tracks/success' do
          subject.call(artist_id: '1aSxMhuvixZ8h9dK9jIDwL')
        end
      end

      it { expect(output).to eq(Helpers::Spotify::Artist.top_tracks_data) }
    end
  end

  describe 'no processing' do
    context 'when wrong artist_id' do
      let(:output) do
        VCR.use_cassette 'spotify/artist/top_tracks/wrong_id' do
          subject.call(artist_id: Helpers::Base::RANDOM_STRING)
        end
      end

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end
  end
end
