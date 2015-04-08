class CardsController < ApplicationController
  def index
    @deck = Array.new(52)
    letter = [H, C, S, D]
    i = 1
    j = 0
    suit = 0
    4.times do
      13.times do
        @deck[j] = i + letter[suit]
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
    @original_deck = @deck
    i = 1
    j = 0
    52.times do
      randnum = rand(51)
      tempvar1 = @deck[j]
      tempvar2 = @deck[randnum]
      @deck[j] = tempvar2
      @deck[randnum] = tempvar1
      j+=1
    end
  end
end
