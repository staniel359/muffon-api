require 'rails_helper'

RSpec.describe LastFM::Search::Artists do
  subject { described_class }

  describe 'successful processing' do
    context 'when artist exists' do
      let(:output) do
        VCR.use_cassette 'lastfm/search/artists/success' do
          subject.call(artist_name: 'wild nothing', limit: 5)
        end
      end

      it { expect(output).to eq(Helpers::LastFM.search_artists_data) }
    end
  end

  describe 'no processing' do
    let(:not_found_data) { Helpers::LastFM.not_found_data }
    let(:empty_data) { Helpers::LastFM.search_artists_empty_data }

    context 'when no artist name given' do
      let(:output) do
        VCR.use_cassette 'lastfm/search/artists/no_name' do
          subject.call(artist_name: nil)
        end
      end

      it { expect(output).to eq(not_found_data) }
    end

    context 'when wrong artist name' do
      let(:output) do
        VCR.use_cassette 'lastfm/search/artists/wrong_name' do
          subject.call(artist_name: Helpers::LastFM::RANDOM_STRING)
        end
      end

      it { expect(output).to eq(empty_data) }
    end
  end
end
