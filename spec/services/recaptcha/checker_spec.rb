RSpec.describe Recaptcha::Checker do
  subject { described_class }

  describe 'successful processing' do
    context 'when recaptcha present' do
      let(:output) do
        VCR.use_cassette 'services/recaptcha/checker/success' do
          subject.call(recaptcha: '03AFcWeA7-20vW-O1M5mFzFKw_3kTpKUk_2OqVVhhPrdOwBhDDufvzPo1KunDa89sPE5V9uaS9yhWL_1L85DHdq3r8kNjVIgJTfFwQLnhhgrXcgUMQ3XN0DFX84qj79zaySTz2KzcoT-I78a0lL9U3wpYylmigsMj0XVQnYLirvBjW8cjb2NEc6mc_A4ToFWP8HjHCNAKqryworZA2022EYBvikAfvSub9IcUlP8uGeTM6GSt3CG8Yxw0Kn3m3OKudfUcS4b3EMknM2GdZGlnCwdrm2qgeP3vMA9OVShDhkK_1GO4SKkVgQAa6BtGtBW8wX1fa4e7Odw07gz6zICnmfoKlSbb79M_4JWPLCuNe-rj1Fc5UCqQQJGaFn8W1Z310TYiOo3cf34AAgtahNmCfEfO6LEer3pT0str2AKvd3NZZsyI6niZs4Jj6GAkodyOuK-ZfkYeZ0RPe9z0WQIw0OUxRnTuZFbA2aEdn4-N6aUsNWM5esde1h98o5Sjm4piF4YkL9UZA013uoLcoECXjDO-ZDzfcleO4eKC8aUFKrKuE_dMosA1IVrw')
        end
      end

      it { expect(output).to be true }
    end
  end

  describe 'no processing' do
    context 'when no recaptcha given' do
      let(:output) { subject.call }

      it { expect(output).to eq(Helpers::Base.bad_request_error) }
    end

    context 'when wrong recaptcha' do
      let(:output) do
        VCR.use_cassette 'services/recaptcha/checker/wrong' do
          subject.call(recaptcha: random)
        end
      end

      it { expect(output).to be false }
    end
  end
end
