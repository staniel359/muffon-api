RSpec.describe YouTube::Video::Related do
  subject { described_class }

  describe 'successful processing' do
    context 'when video present' do
      let(:output) do
        VCR.use_cassette 'services/youtube/video/related/success' do
          subject.call(video_id: '1aTIkQf3eRY', limit: 5, page: 'CBQQAA')
        end
      end

      it { expect(output).to eq(Helpers::YouTube::Video.related_data) }
    end
  end

  describe 'no processing' do
    context 'when no video_id given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong video_id' do
      let(:output) do
        VCR.use_cassette 'services/youtube/video/related/wrong_id' do
          subject.call(video_id: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
