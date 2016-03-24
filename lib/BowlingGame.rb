class BowlingGame
  def initialize(*player_list)
    @players = player_list
  end



  def scores
    return {@players.first => nil}
  end
end
