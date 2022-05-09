RSpec.describe Muffon::Radio::Tag::Artists do
  subject { described_class }

  describe 'successful processing' do
    context 'when tag exists' do
      let(:output) do
        VCR.use_cassette 'services/muffon/radio/tag/artists/success' do
          subject.call(tag: '80s')
        end
      end

      it { expect(output).to eq(Helpers::Muffon::Radio::Tag.artists_data) }
    end
  end

  describe 'no processing' do
    context 'when no tag name given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong tag name' do
      let(:output) do
        VCR.use_cassette 'services/muffon/radio/tag/artists/wrong_name' do
          subject.call(tag: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
