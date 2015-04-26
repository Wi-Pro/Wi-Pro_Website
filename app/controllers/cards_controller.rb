class CardsController
  def index
    @deck = Array.new(52)
    @original_deck = Array.new(52)
    letter = ['H', 'C', 'S', 'D']
    number = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
    i = 1
    j = 0
    suit = 0
    4.times do
      13.times do
        @deck[j] = number[j%13] + letter[suit]
        j+=1
        i+=1
      end
      i=1
      suit +=1
    end
    #52.times do
    #  @deck[j] = i
    #  j+=1
    #  i+=1
    #end
    j = 0
    52.times do
      @original_deck[j] = @deck[j]
      j+=1
    end
    i = 1
    j = 0
    500000.times do
      randnum1 = rand(51)
      randnum2 = rand(51)
      tempvar1 = @deck[randnum1]
      tempvar2 = @deck[randnum2]
      @deck[randnum1] = tempvar2
      @deck[randnum2] = tempvar1
    end
  end
end
