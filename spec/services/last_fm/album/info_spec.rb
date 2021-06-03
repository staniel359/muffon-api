require 'rails_helper'

RSpec.describe LastFM::Album::Info do
  subject { described_class }

  describe 'successful processing' do
    context 'when artist and album exists' do
      let(:output) do
        VCR.use_cassette 'services/lastfm/album/info/success' do
          subject.call(artist: 'wild nothing', album: 'nocturne')
        end
      end

      it { expect(output).to eq(Helpers::LastFM::Album.info_data) }
    end
  end

  describe 'no processing' do
    context 'when no album title given' do
      let(:output) { subject.call(artist: 'wild nothing') }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong album title' do
      let(:output) do
        VCR.use_cassette 'services/lastfm/album/info/wrong_title' do
          subject.call(artist: 'wild nothing', album: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
