require 'rails_helper'

RSpec.describe Bandcamp::Label::Artists do
  subject { described_class }

  describe 'successful processing' do
    context 'when label present' do
      let(:output) do
        VCR.use_cassette 'services/bandcamp/label/artists/success' do
          subject.call(label_id: '2304199212', limit: 5, page: 2)
        end
      end

      it { expect(output).to eq(Helpers::Bandcamp::Label.artists_data) }
    end
  end

  describe 'no processing' do
    context 'when no args' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong label' do
      let(:output) do
        VCR.use_cassette 'services/bandcamp/label/artists/wrong_label' do
          subject.call(label_id: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
