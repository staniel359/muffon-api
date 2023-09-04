RSpec.describe LastFM::Track::Tags do
  subject { described_class }

  describe 'successful processing' do
    context 'when track exists' do
      let(:output) do
        VCR.use_cassette 'services/lastfm/track/tags/success' do
          subject.call(artist_name: 'wild nothing', track_title: 'chinatown')
        end
      end

      it { expect(output).to eq(Helpers::LastFM::Track.tags_data) }
    end
  end

  describe 'no processing' do
    context 'when no artist name given' do
      let(:output) { subject.call(track_title: 'chinatown') }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when no title given' do
      let(:output) { subject.call(artist_name: 'wild nothing') }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong artist' do
      let(:output) do
        VCR.use_cassette 'services/lastfm/track/tags/wrong_artist' do
          subject.call(artist_name: random, track_title: 'chinatown')
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end

    context 'when wrong title' do
      let(:output) do
        VCR.use_cassette 'services/lastfm/track/tags/wrong_title' do
          subject.call(artist_name: 'wild nothing', track_title: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
