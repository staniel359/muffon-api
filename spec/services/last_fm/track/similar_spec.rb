RSpec.describe LastFM::Track::Similar do
  subject { described_class }

  describe 'successful processing' do
    context 'when artist and track exists' do
      let(:output) do
        VCR.use_cassette(
          'services/lastfm/track/similar/success'
        ) do
          subject.call(
            artist_name: 'wild nothing',
            track_title: 'chinatown',
            page: '2',
            limit: '5',
            profile_id: '1'
          )
        end
      end

      it { expect(output).to eq(lastfm_track_similar_data) }
    end
  end

  describe 'no processing' do
    context 'when no track title given' do
      let(:output) do
        subject.call(
          artist_name: 'wild nothing'
        )
      end

      it { expect { output }.to raise_error(bad_request_error) }
    end

    context 'when no artist name given' do
      let(:output) do
        subject.call(
          track_title: 'chinatown'
        )
      end

      it { expect { output }.to raise_error(bad_request_error) }
    end

    context 'when wrong track title' do
      let(:output) do
        VCR.use_cassette(
          'services/lastfm/track/similar/wrong_title'
        ) do
          subject.call(
            artist_name: 'wild nothing',
            track_title: random_string
          )
        end
      end

      it { expect { output }.to raise_error(not_found_error) }
    end

    context 'when wrong artist name' do
      let(:output) do
        VCR.use_cassette(
          'services/lastfm/track/similar/wrong_name'
        ) do
          subject.call(
            artist_name: random_string,
            track_title: 'chinatown'
          )
        end
      end

      it { expect { output }.to raise_error(not_found_error) }
    end
  end
end
