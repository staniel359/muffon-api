RSpec.describe LastFM::Track::Description do
  subject { described_class }

  describe 'successful processing' do
    context 'when artist and track exists' do
      let(:output) do
        VCR.use_cassette 'services/lastfm/track/description/success' do
          subject.call(artist_name: 'kate bush', track_title: 'hounds of love')
        end
      end

      it { expect(output).to eq(Helpers::LastFM::Track.description_data) }
    end
  end

  describe 'no processing' do
    context 'when no track title given' do
      let(:output) { subject.call(artist_name: 'kate bush') }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when no artist name given' do
      let(:output) { subject.call(track_title: 'hounds of love') }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong track title' do
      let(:output) do
        VCR.use_cassette 'services/lastfm/track/description/wrong_title' do
          subject.call(artist_name: 'kate bush', track_title: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end

    context 'when wrong artist name' do
      let(:output) do
        VCR.use_cassette 'services/lastfm/track/description/wrong_name' do
          subject.call(artist_name: random, track_title: 'hounds of love')
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
