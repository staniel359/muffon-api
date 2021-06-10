RSpec.describe LastFM::Album::Tags do
  subject { described_class }

  describe 'successful processing' do
    context 'when album exists' do
      let(:output) do
        VCR.use_cassette 'services/lastfm/album/tags/success' do
          subject.call(artist: 'wild nothing', album: 'nocturne')
        end
      end

      it { expect(output).to eq(Helpers::LastFM::Album.tags_data) }
    end
  end

  describe 'no processing' do
    context 'when no artist name given' do
      let(:output) { subject.call(album: 'nocturne') }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when no album title given' do
      let(:output) { subject.call(artist: 'wild nothing') }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong artist name' do
      let(:output) do
        VCR.use_cassette 'services/lastfm/album/tags/wrong_artist' do
          subject.call(artist: random, album: 'nocturne')
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end

    context 'when wrong album title' do
      let(:output) do
        VCR.use_cassette 'services/lastfm/album/tags/wrong_title' do
          subject.call(artist: 'wild nothing', album: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
