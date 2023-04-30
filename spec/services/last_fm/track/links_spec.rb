RSpec.describe LastFM::Track::Links do
  subject { described_class }

  describe 'successful processing' do
    context 'when track exists' do
      let(:output) do
        VCR.use_cassette 'services/lastfm/track/links/success' do
          subject.call(artist: 'wild nothing', track: 'chinatown')
        end
      end

      it { expect(output).to eq(Helpers::LastFM::Track.links_data) }
    end
  end

  describe 'no processing' do
    context 'when no artist name given' do
      let(:output) { subject.call(track: 'chinatown') }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when no title given' do
      let(:output) { subject.call(artist: 'wild nothing') }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong artist' do
      let(:output) do
        VCR.use_cassette 'services/lastfm/track/links/wrong_artist' do
          subject.call(artist: random, track: 'chinatown')
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end

    context 'when wrong title' do
      let(:output) do
        VCR.use_cassette 'services/lastfm/track/links/wrong_title' do
          subject.call(artist: 'wild nothing', track: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
