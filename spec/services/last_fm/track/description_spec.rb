RSpec.describe LastFM::Track::Description do
  subject { described_class }

  describe 'successful processing' do
    context 'when artist and track exists' do
      let(:output) do
        VCR.use_cassette(
          'services/lastfm/track/description/success'
        ) do
          subject.call(
            artist_name: 'kate bush',
            track_title: 'hounds of love'
          )
        end
      end

      it { expect(output).to eq(lastfm_track_description_data) }
    end
  end

  describe 'no processing' do
    context 'when no track title given' do
      let(:output) do
        subject.call(
          artist_name: 'kate bush'
        )
      end

      it { expect { output }.to raise_error(bad_request_error) }
    end

    context 'when no artist name given' do
      let(:output) do
        subject.call(
          track_title: 'hounds of love'
        )
      end

      it { expect { output }.to raise_error(bad_request_error) }
    end

    context 'when wrong track title' do
      let(:output) do
        VCR.use_cassette(
          'services/lastfm/track/description/wrong_title'
        ) do
          subject.call(
            artist_name: 'kate bush',
            track_title: random_string
          )
        end
      end

      it { expect { output }.to raise_error(not_found_error) }
    end

    context 'when wrong artist name' do
      let(:output) do
        VCR.use_cassette(
          'services/lastfm/track/description/wrong_name'
        ) do
          subject.call(
            artist_name: random_string,
            track_title: 'hounds of love'
          )
        end
      end

      it { expect { output }.to raise_error(not_found_error) }
    end
  end
end
