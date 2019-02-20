class CardController < ApplicationController
  def new
    @card = Card.new
    @list = List.find_by(id: params[:list_id])
  end

  def create
    @card = List.find_by(id: params[:list_id])
    if @card.save
      redirect_to :root
    else
      @card.valid?
      render action: :new
    end
  end

end
