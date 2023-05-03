class BasketsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_basket, only: [:show, :edit, :update, :destroy, :sign_in, :new_order, :cancel_order]

  def new_order
    @order = Order.new(customer_id: Current.customer.id, basket_id: @basket.id)
    if @order.save
      redirect_back_or_to({ action: "show", id: @basket.id, notice: "Commande effectuée" })
    else
      redirect_back_or_to({ action: "show", id: @basket.id, notice: "Une erreur a été rencontrée" })
    end
  end

  def cancel_order
    order = Order.find_by(customer_id: Current.customer.id, basket_id: @basket.id)
    order.destroy
    redirect_back_or_to({ action: "show", id: @basket.id, notice: "La commande a bien été annulée" })
  end

  def calendar
    @baskets = Basket.all
  end
   
  def index
    @baskets = Basket.all
  end

  def show
  end

  def new
    @basket = Basket.new
  end

  def create
    @basket = Basket.new(basket_params)

    if @basket.save
      redirect_to baskets_path, notice: "basket was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @basket.update(basket_params)
      redirect_to baskets_path, notice: "basket was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @basket.destroy
    redirect_to baskets_path, notice: "basket was successfully destroyed."
  end

  private

  def set_basket
    @basket = Basket.find(params[:id])
  end

  def basket_params
    params.require(:basket).permit(:content, :date, :limit_max_baskets)
  end
end
