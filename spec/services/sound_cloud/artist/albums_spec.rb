RSpec.describe SoundCloud::Artist::Albums do
  subject { described_class }

  describe 'successful processing' do
    context 'when artist present' do
      let(:output) do
        VCR.use_cassette 'services/soundcloud/artist/albums/success' do
          subject.call(artist_id: '3820545', limit: 5, page: 2)
        end
      end

      it { expect(output).to eq(Helpers::SoundCloud::Artist.albums_data) }
    end
  end

  describe 'no processing' do
    context 'when no artist_id given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong artist' do
      let(:output) do
        VCR.use_cassette 'services/soundcloud/artist/albums/wrong_id' do
          subject.call(artist_id: '7652837461927649')
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
