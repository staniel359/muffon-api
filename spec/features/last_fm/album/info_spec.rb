require 'rails_helper'

RSpec.describe LastFM::Album::Info do
  subject { described_class }

  describe 'successful processing' do
    context 'when artist and album exists' do
      let(:output) do
        VCR.use_cassette 'lastfm/album/info/success' do
          subject.call(
            artist: 'wild nothing', album: 'nocturne'
          )
        end
      end

      it { expect(output).to eq(Helpers::LastFM.album_info_data) }
    end
  end

  describe 'no processing' do
    let(:not_found_error) { Helpers::LastFM.not_found_error }

    context 'when no album title given' do
      let(:output) do
        VCR.use_cassette 'lastfm/album/info/no_album_title' do
          subject.call(artist: 'wild nothing')
        end
      end

      it { expect(output).to eq(not_found_error) }
    end

    context 'when wrong album title' do
      let(:output) do
        VCR.use_cassette 'lastfm/album/info/wrong_album_title' do
          subject.call(
            artist: 'wild nothing',
            album: Helpers::LastFM::RANDOM_STRING
          )
        end
      end

      it { expect(output).to eq(not_found_error) }
    end
  end
end
