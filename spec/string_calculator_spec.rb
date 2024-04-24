#literal_frozen_string: true
require_relative '../string_calculator'

describe StringCalculator do
  describe '#add' do
    context 'when empty string passed' do
      it 'returns 0' do
        expect(StringCalculator.add('')).to eq 0
      end
    end

    context 'when string is passed with numbers' do
      it "returns the number itself for a single number" do
        expect(StringCalculator.add("1")).to eq(1)
      end

      it "returns the sum of two numbers" do
        expect(StringCalculator.add("1,5")).to eq(6)
      end

      it "returns the sum of any amount of numbers" do
        expect(StringCalculator.add('1,3,5,6')).to eq(15)
      end
    end
  end
end