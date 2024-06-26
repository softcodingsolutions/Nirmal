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

    context 'Valid string is passed as an argument' do
      it 'expects only one string argument' do
        expect{ StringCalculator.add('11') }.not_to raise_error(ArgumentError, 'The method signature permits only one argument, which must be a string.')
      end
    end

    context 'Number is passed as an argument' do
      it 'expects only on string argument' do
        expect { StringCalculator.add(11).to raise_error(ArgumentError, 'The method signature permits only one argument, which must be a string.') }
      end
    end

    context 'when more than one argument is passed' do
      it 'raises error when multiple string arguments passed' do
        expect { StringCalculator.add('1', '2') }.to raise_error(ArgumentError, /wrong number of arguments/)
      end
    end

    context 'when string contains valid new line character' do
      it 'returns sum of passed numbers' do
        expect(StringCalculator.add("1\n2,3")).to eq(6)
      end
    end

    context 'when string contains invalid new line character' do
      it 'returns error when new line character is passed at the end' do
        expect(StringCalculator.add("1,\n")).to eq('Invalid input')
      end
    end

    context 'when string has indifferent separators' do
      it 'considers delimiter and sum number' do
        expect(StringCalculator.add("//;\n1;2")).to eq 3
      end
    end

    context 'when string has different separators but with comma also' do
      it 'throws invalid input error' do
        expect(StringCalculator.add("//;\n1;2,3")).to eq 'Invalid input'
      end
    end

    context 'when string has a single negative number' do
      it 'raise exception with message containing negative number' do
        expect { StringCalculator.add('-1,2') }.to raise_error(RuntimeError, 'negative numbers are not allowed -1')
      end

      it 'does not raise exception' do
        expect { StringCalculator.add("//;\n1,4,3") }.not_to raise_error(RuntimeError, 'negative numbers are not allowed')
      end
    end

    context 'when string has multiple negative numbers' do
      it 'raise exception with message containing negative numbers' do
        expect { StringCalculator.add('-1,2,-3').to raise_error(RuntimeError, 'negative numbers are not allowed -1,-3') }
      end

      it 'does not raise exceptiion' do
        expect { StringCalculator.add('//;1,3,5') }.not_to raise_error(RuntimeError, 'negative numbers are not allowed')
      end
    end

    context 'when string numbers with different delimiter' do
      it 'does raise an exception with negative number and different delimiter' do
        expect { StringCalculator.add("//;\n1;2;-3") }.to raise_error(RuntimeError, 'negative numbers are not allowed -3')
      end

      it 'does not raise any exception with positive number and different delimiter' do
        expect { StringCalculator.add("//;\n1;2;3") }.not_to raise_error(RuntimeError, 'negative numbers are not allowed')
      end
    end
  end
end