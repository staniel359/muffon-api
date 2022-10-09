RSpec.describe Genius::Annotation::Info do
  subject { described_class }

  describe 'successful processing' do
    context 'when annotation present' do
      let(:output) do
        VCR.use_cassette 'services/genius/annotation/info/success' do
          subject.call(annotation_id: '3128578')
        end
      end

      it { expect(output).to eq(Helpers::Genius::Annotation.info_data) }
    end
  end

  describe 'no processing' do
    context 'when no id given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong id' do
      let(:output) do
        VCR.use_cassette 'services/genius/annotation/info/wrong_id' do
          subject.call(annotation_id: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
