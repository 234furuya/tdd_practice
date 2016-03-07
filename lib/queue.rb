
class Queue
  def initialize
    @list = []
  end

  def add(number)
    @list.push(number)
  end

  def list
    @list
  end
end