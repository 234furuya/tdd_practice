class Frame
  def initialize(num, down_pins_list)
    @num = num
    @down_pins_list = down_pins_list
    validate_format
    validate_pins_num
  end
  
  def validate_format
    @down_pins_list.each do |num|
      raise Exception unless num.kind_of?(Integer)
      raise Exception if num > 10 || num < 0 
    end
  end
  
  def validate_pins_num
    raise Exception unless @down_pins_list.length == 2
    if (@down_pins_list[0] + @down_pins_list[1]) > 10
      raise Exception
    end  
  end  
  
  def score(next_frame=nil, two_next_frame=nil)
    score = 0
    @down_pins_list.each do |pins|
      score += pins
    end
    score
  end
  
  def first_throw
    @down_pins_list[0]
  end      
  
  def second_throw
    @down_pins_list[1]
  end      
end

class StrikeFrame < Frame
  def score(next_frame, two_next_frame=nil)
    return 10 + 10 + two_next_frame.first_throw if next_frame.kind_of?(StrikeFrame)
    10 + next_frame.first_throw + next_frame.second_throw
  end  
end

class SpareFrame < Frame
  def score(next_frame, two_next_frame=nil)
    10 + next_frame.first_throw
  end
end

class LastFrame < Frame
  def validate_pins_num
    return super if @down_pins_list.length == 2
    if @down_pins_list.length == 3
      if @down_pins_list[0] == 10
        return if @down_pins_list[1] == 10
        raise Exception if (@down_pins_list[1] + @down_pins_list[2]) > 10
        return
      end  
      return if (@down_pins_list[0] + @down_pins_list[1]) == 10
      raise Exception
    end
    raise Exception
  end
end  
