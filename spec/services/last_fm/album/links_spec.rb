RSpec.describe LastFM::Album::Links do
  subject { described_class }

  describe 'successful processing' do
    context 'when album exists' do
      let(:output) do
        VCR.use_cassette 'services/lastfm/album/links/success' do
          subject.call(artist_name: 'wild nothing', album_title: 'nocturne')
        end
      end

      it { expect(output).to eq(Helpers::LastFM::Album.links_data) }
    end
  end

  describe 'no processing' do
    context 'when no artist name given' do
      let(:output) { subject.call(album_title: 'nocturne') }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when no album title given' do
      let(:output) { subject.call(artist_name: 'wild nothing') }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong artist name' do
      let(:output) do
        VCR.use_cassette 'services/lastfm/album/links/wrong_artist' do
          subject.call(artist_name: random, album_title: 'nocturne')
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end

    context 'when wrong album title' do
      let(:output) do
        VCR.use_cassette 'services/lastfm/album/links/wrong_title' do
          subject.call(artist_name: 'wild nothing', album_title: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
