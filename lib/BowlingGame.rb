class BowlingGame
  def initialize(player_list)
    @players = []
    player_list.each do |player_name|
      @players.push(Player.new(player_name))
    end
  end

  def set_result(player_result)
    player_result.each do |player_name, result|
      @players.each do |player|
        if player.name == player_name
          player.set_result(result)
          break
        end  
      end
    end
  end  

  def scores
    player_scores = {}
    @players.each do |player|
      player_scores.merge!({player.name => player.score})
    end  
    player_scores
  end
end
