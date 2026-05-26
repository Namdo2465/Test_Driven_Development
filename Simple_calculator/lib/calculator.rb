class Calculator
    def add(*numbers)
        return numbers.reduce(0) { |sum, number| sum + number }
    end
  end