RSpec.describe LastFM::Track::Similar do
  subject { described_class }

  describe 'successful processing' do
    context 'when artist and track exists' do
      let(:output) do
        VCR.use_cassette 'services/lastfm/track/similar/success' do
          subject.call(artist_name: 'wild nothing', track_title: 'chinatown', limit: 5, page: 2, profile_id: 1)
        end
      end

      it { expect(output).to eq(Helpers::LastFM::Track.similar_data) }
    end
  end

  describe 'no processing' do
    context 'when no track title given' do
      let(:output) { subject.call(artist_name: 'wild nothing') }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when no artist name given' do
      let(:output) { subject.call(track_title: 'chinatown') }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong track title' do
      let(:output) do
        VCR.use_cassette 'services/lastfm/track/similar/wrong_title' do
          subject.call(artist_name: 'wild nothing', track_title: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end

    context 'when wrong artist name' do
      let(:output) do
        VCR.use_cassette 'services/lastfm/track/similar/wrong_name' do
          subject.call(artist_name: random, track_title: 'chinatown')
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
