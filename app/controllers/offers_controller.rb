class OffersController < ApplicationController
  def index
    @offers = Offer.all
  end

  def show
    @offer = Offer.find(params[:id])
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    #@offer.user = current_user
    #authorize @offer

    if @offer.save
      redirect_to @offer, notice: "Your offer was created !"
    else
      render :new
    end
  end

  def edit
    @offer = Offer.find(params[:id])
    #authorize @offer
  end

  def update
    @offer = Offer.find(params[:id])
    #authorize @offer
    @offer.update(offer_params)
    redirect_to @offer, notice: "Your offer was updated !"
  end

  def destroy
    @offer = Offer.find(params[:id])
    #authorize @offer
    @offer.destroy
    redirect_to "/", notice: "Your offer was deleted !"
    #redirect_to dashboard_path
  end

  private

  def offer_params
    params.require(:offer).permit(:address, :fee, :start_date, :end_date, :status, :user_id, photos: [])
  end
end
