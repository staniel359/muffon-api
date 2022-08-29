RSpec.describe LastFM::Track::Profiles do
  subject { described_class }

  describe 'successful processing' do
    context 'when artist and track exists' do
      let(:output) do
        VCR.use_cassette 'services/lastfm/track/profiles/success' do
          subject.call(artist: 'kate bush', track: 'hounds of love', limit: 5, page: 2)
        end
      end

      it { expect(output).to eq(Helpers::LastFM::Track.profiles_data) }
    end
  end

  describe 'no processing' do
    context 'when no track title given' do
      let(:output) { subject.call(artist: 'kate bush') }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when no artist name given' do
      let(:output) { subject.call(track: 'hounds of love') }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong track title' do
      let(:output) do
        VCR.use_cassette 'services/lastfm/track/profiles/wrong_title' do
          subject.call(artist: 'kate bush', track: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end

    context 'when wrong artist name' do
      let(:output) do
        VCR.use_cassette 'services/lastfm/track/profiles/wrong_artist' do
          subject.call(artist: random, track: 'hounds of love')
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
