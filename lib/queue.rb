
class Queue
  MAX = 5

  def initialize
    @list = []
  end

  def add(number)
    raise Exception if @list.length >= 5
    @list.push(number)
  end

  def get
    raise Exception if @list.empty?
    @list.shift
  end

  def list
    @list
  end
end