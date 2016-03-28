class Player
  def initialize(name)
    @name = name
    @frames = []
  end
  
  def name
    @name
  end  
  
  def set_result(result)
    validate_result_list(result)
    result.each_with_index do |frame_result, idx|
      @frames.push(create_frame(idx, frame_result))
    end    
  end
  
  def create_frame(idx, pins_list)
    frame_number = idx + 1
    validate_pins_list(pins_list)
    if frame_number == 10
      frame = LastFrame.new(10, pins_list)
    elsif pins_list[0] == 10
      frame = StrikeFrame.new(frame_number, pins_list)
    elsif (pins_list[0] + pins_list[1]) == 10
      frame = SpareFrame.new(frame_number, pins_list)
    else
      frame = Frame.new(frame_number, pins_list)
    end
    frame
  end
  
  def score
    score = 0
    @frames.each_with_index do |frame,idx|
      if idx == 9
        score += frame.score
      else
        score += frame.score(@frames[idx+1], @frames[idx+2])
      end  
    end
    score
  end
  
  def validate_result_list(result)
    raise Exception unless result.kind_of?(Array)
    raise Exception unless result.length == 10
    true
  end  
  
  def validate_pins_list(pins_list)
    raise Exception unless pins_list.kind_of?(Array)
    raise Exception if pins_list.length < 2
    true
  end  
end