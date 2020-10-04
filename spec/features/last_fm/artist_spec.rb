require 'rails_helper'

RSpec.describe LastFM::Artist do
  subject { described_class }

  describe 'successful processing' do
    context 'when artist exists' do
      let(:output) do
        VCR.use_cassette 'lastfm_artist_success' do
          subject.call(artist_name: 'wild nothing')
        end
      end

      it { expect(output).to eq(Helpers::LastFM.artist_data) }
    end
  end

  describe 'no processing' do
    let(:error_data) { Helpers::LastFM.error_data }

    context 'when no artist name given' do
      let(:output) do
        VCR.use_cassette 'lastfm_artist_no_name' do
          subject.call(artist_name: nil)
        end
      end

      it { expect(output).to eq(error_data) }
    end

    context 'when wrong artist name' do
      let(:output) do
        VCR.use_cassette 'lastfm_artist_wrong_name' do
          subject.call(artist_name: Helpers::LastFM::RANDOM_STRING)
        end
      end

      it { expect(output).to eq(error_data) }
    end
  end
end
