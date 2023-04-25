class BasketsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_basket, only: [:show, :edit, :update, :destroy, :sign_in, :new_order]

  def new_order
    @order = Order.new(customer_id: Current.customer.id, basket_id: @basket.id)
    if @order.save
      redirect_to root_path, notice: "La order a bien été effectuée."
    else
      redirect_to root_path, notice: "Une erreur a été rencontré."
    end
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
    params.require(:basket).permit(:content, :date)
  end
end
