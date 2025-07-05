RSpec.describe LastFM::Artist::Shows do
  subject { described_class }

  describe 'successful processing' do
    context 'when artist exists' do
      let(:output) do
        VCR.use_cassette 'services/lastfm/artist/shows/success' do
          subject.call(artist_name: 'lady gaga', page: 2, profile_id: 1)
        end
      end

      it { expect(output).to eq(Helpers::LastFM::Artist.shows_data) }
    end
  end

  describe 'no processing' do
    context 'when no artist name given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong artist name' do
      let(:output) do
        VCR.use_cassette 'services/lastfm/artist/shows/wrong_name' do
          subject.call(artist_name: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
