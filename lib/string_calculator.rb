module StringCalculator
  def self.run(number_str)
    return 0 if number_str.empty?
    number_list = number_str.split(',')
    number_list.map do |num_str|
      num = num_str.to_i
    end
  end
end