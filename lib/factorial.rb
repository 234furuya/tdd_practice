module Factorial
  def self.calculate(number)
    fact = 1
    number.times do |time|
      fact = fact * (time + 1)
    end
    return fact
  end
end