#literal_frozen_string: true
require_relative '../string_calculator'

describe StringCalculator do
  describe '#add' do
    context 'when empty string passed' do
      it 'returns 0' do
        expect(StringCalculator.add('')).to eq 0
      end
    end
  end
end