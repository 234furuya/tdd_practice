module CalculateScore
  def self.score(frame_list)
    score = nil
    frame_num = frame_list.length
    frame_num.times do |index|
      target_frame = frame_list(index)
      next_frame = frame_list(index + 1)
      score += frame_score(target_frame, next_frame)
    end
    return nil
  end

  def frame_score(target_frame, next_frame)
    if target_frame.first == 10
      return 10 unless next_frame
      return 10 + num_of_down_pins_at(next_frame)
    elsif down_pins_num_at(target_frame) == 10
      return 10 unless next_frame
      return 10 + next_frame.first
    else
      num_of_down_pins_at(target_frame)
    end
  end

  def num_of_down_pins_at(frame)
    frame[0] + frame[1]
  end
end
