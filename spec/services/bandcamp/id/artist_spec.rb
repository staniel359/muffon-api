RSpec.describe Bandcamp::Id::Artist do
  subject { described_class }

  describe 'successful processing' do
    context 'when artist present' do
      let(:output) do
        VCR.use_cassette 'services/bandcamp/id/artist/success' do
          subject.call(artist: 'wildnothingct')
        end
      end

      it { expect(output).to eq(Helpers::Bandcamp::Id.artist_data) }
    end

    context 'when label present' do
      let(:output) do
        VCR.use_cassette 'services/bandcamp/id/label/success' do
          subject.call(artist: 'capturedtracks')
        end
      end

      it { expect(output).to eq(Helpers::Bandcamp::Id.label_data) }
    end
  end

  describe 'no processing' do
    context 'when no artist' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong artist' do
      let(:output) do
        VCR.use_cassette 'services/bandcamp/id/artist/wrong_name' do
          subject.call(artist: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
