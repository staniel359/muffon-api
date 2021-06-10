RSpec.describe Bandcamp::Artist::Albums do
  subject { described_class }

  describe 'successful processing' do
    context 'when artist present' do
      let(:output) do
        VCR.use_cassette 'services/bandcamp/artist/albums/success' do
          subject.call(artist_id: '2707934946', limit: 5, page: 2)
        end
      end

      it { expect(output).to eq(Helpers::Bandcamp::Artist.albums_data) }
    end
  end

  describe 'no processing' do
    context 'when no args' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong artist' do
      let(:output) do
        VCR.use_cassette 'services/bandcamp/artist/albums/wrong_artist' do
          subject.call(artist_id: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
