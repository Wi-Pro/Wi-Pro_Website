class CardsController < ApplicationController
  def index
    deck = Array.new(52)
    i = 1
    j = 0
    4.times do
      13.times do
        deck[j] = i
        j+=1
        i+=1
      end
      i=1
    end
  end
end
