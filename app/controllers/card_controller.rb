class CardController < ApplicationController
  def new
    @card = Card.new
    @list = List.find_by(id: params[:list_id])
  end

  def create
    @card = Card.new(card_params)
    if @card.save
      redirect_to :root
    else
      @card.valid?
      render action: :new
    end
  end

  def show
    @card = Card.find_by(id: params[:id])
  end

  # def edit
  #   @card = Card.find_by(id: params[:id])
  # end

  # def update
  #   @card = Card.find_by(id: params[:id])
  #   if @card.update.attributes(card_params)
  #     redirect_to :root
  #   else
  #     @ardd.valid?
  #     render action: :update
  # end


  private
    def card_params
      params.require(:card).permit(:title, :memo).merge(list_id: params[:list_id])
    end

end
