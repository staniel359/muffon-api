require 'rails_helper'

RSpec.describe Bandcamp::Track::Info do
  subject { described_class }

  describe 'successful processing' do
    context 'when link present' do
      let(:output) do
        VCR.use_cassette 'bandcamp/track/info/success' do
          subject.call(
            link: 'wildnothingct.bandcamp.com/track/letting-go'
          )
        end
      end

      it { expect(output).to eq(Helpers::Bandcamp::Track.info_data) }
    end
  end

  describe 'no processing' do
    context 'when no link given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong link' do
      let(:output) do
        VCR.use_cassette 'bandcamp/track/info/wrong_link' do
          subject.call(link: Helpers::Base::RANDOM_STRING)
        end
      end

      it { expect(output).to eq(Helpers::Base.not_found_error) }
    end
  end
end
