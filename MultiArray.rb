class MultiArray
  attr_accessor :array
  attr_reader :x, :y
  def initialize(x, y)
    @x = x
    @y = y
    @array = Array.new(y){|ay| Array.new(x) {|ax| 0}}
  end

  def insertPos(elem, posX, posY)
    @array[posX][posY] = elem
  end

  def full?
    !@array.flatten().include?(0)
  end

  def clearArray
    @array = Array.new(@y){|ay| Array.new(@x){|ax| 0}}
  end

  def getDiagonal
    result = []
    @array.each_with_index {|posX, indexX|
      posX.each_with_index {|posY, indexY|
        result << posY if indexX == indexY }}
    result
  end

  def reverseArray
    result = []
    @array.reverse.each {|posX| result << posX}
    result
  end

  def getAntiDiagonal
   result = []
   antiArray = reverseArray
   antiArray.each_with_index {|posX, indexX|
     posX.each_with_index {|posY, indexY|
       result << posY if indexX == indexY}}
   result
  end

  def arrayPositionClear?(posX, posY)
    return true if @array[posX][posY] == 0
    return false
  end

end


