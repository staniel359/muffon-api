require 'rails_helper'

RSpec.describe LastFM::Artist::Albums do
  subject { described_class }

  describe 'successful processing' do
    context 'when artist exists' do
      let(:output) do
        VCR.use_cassette 'lastfm/artist/albums/success' do
          subject.call(artist: 'wild nothing', limit: 5)
        end
      end

      it { expect(output).to eq(Helpers::LastFM.artist_albums_data) }
    end
  end

  describe 'no processing' do
    let(:not_found_data) { Helpers::LastFM.not_found_data }

    context 'when no artist name given' do
      let(:output) do
        VCR.use_cassette 'lastfm/artist/albums/no_name' do
          subject.call(artist: nil)
        end
      end

      it { expect(output).to eq(not_found_data) }
    end

    context 'when wrong artist name' do
      let(:output) do
        VCR.use_cassette 'lastfm/artist/albums/wrong_name' do
          subject.call(artist: Helpers::LastFM::RANDOM_STRING)
        end
      end

      it { expect(output).to eq(not_found_data) }
    end
  end
end
