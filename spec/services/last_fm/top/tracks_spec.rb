RSpec.describe LastFM::Top::Tracks do
  subject { described_class }

  describe 'successful processing' do
    context 'when no primary args' do
      let(:output) do
        VCR.use_cassette 'services/lastfm/top/tracks/success' do
          subject.call(limit: 5, page: 2, profile_id: 1)
        end
      end

      it { expect(output).to eq(Helpers::LastFM::Top.tracks_data) }
    end

    context 'when country present' do
      let(:output) do
        VCR.use_cassette(
          'services/lastfm/top/tracks/success_country'
        ) do
          subject.call(
            country: 'US'
          )
        end
      end

      it { expect(output).to eq(Helpers::LastFM::Top.tracks_country_data) }
    end
  end

  describe 'no processing' do
    context 'when wrong country' do
      let(:output) do
        VCR.use_cassette(
          'services/lastfm/top/tracks/wrong_country'
        ) do
          subject.call(
            country: random_string
          )
        end
      end

      it { expect { output }.to raise_error(not_found_error) }
    end
  end
end
