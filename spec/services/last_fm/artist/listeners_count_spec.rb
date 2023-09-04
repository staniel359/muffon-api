RSpec.describe LastFM::Artist::ListenersCount do
  subject { described_class }

  describe 'successful processing' do
    context 'when artist exists' do
      let(:output) do
        VCR.use_cassette 'services/lastfm/artist/listeners_count/success' do
          subject.call(artist_name: 'wild nothing')
        end
      end

      it { expect(output).to eq(Helpers::LastFM::Artist.listeners_count_data) }
    end
  end

  describe 'no processing' do
    context 'when no name given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong name' do
      let(:output) do
        VCR.use_cassette 'services/lastfm/artist/listeners_count/wrong_name' do
          subject.call(artist_name: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
