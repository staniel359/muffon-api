require 'rails_helper'

RSpec.describe LastFM::Artist::Info do
  subject { described_class }

  describe 'successful processing' do
    context 'when artist exists' do
      let(:output) do
        VCR.use_cassette 'lastfm/artist/info/success' do
          subject.call(artist: 'wild nothing')
        end
      end

      it { expect(output).to eq(Helpers::LastFM.artist_info_data) }
    end
  end

  describe 'no processing' do
    context 'when no artist name given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::LastFM.bad_request_error) }
    end

    context 'when wrong artist name' do
      let(:output) do
        VCR.use_cassette 'lastfm/artist/info/wrong_name' do
          subject.call(artist: Helpers::LastFM::RANDOM_STRING)
        end
      end

      it { expect(output).to eq(Helpers::LastFM.not_found_error) }
    end
  end
end
