require 'rails_helper'

RSpec.describe Odnoklassniki::Album::Info do
  subject { described_class }

  describe 'successful processing' do
    context 'when album_id present' do
      let(:output) do
        VCR.use_cassette 'odnoklassniki/album/info/success' do
          subject.call(album_id: '122909892023105')
        end
      end

      it do
        expect(output).to eq(
          Helpers::Odnoklassniki::Album.info_data
        )
      end
    end
  end

  describe 'no processing' do
    context 'when no album_id given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong album_id' do
      let(:output) do
        VCR.use_cassette 'odnoklassniki/album/info/wrong_id' do
          subject.call(album_id: random)
        end
      end

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end
  end
end