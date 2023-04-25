class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy, :sign_in]

  def index
    @customers = Customer.where(admin: false)
  end

  def admin_index
    @customers = Customer.where(admin: false)
  end

  def show
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      login(@customer)
      redirect_to root_path, notice: "customer was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      redirect_to admin_index_customer_path, notice: "customer was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @customer.destroy
    redirect_to admin_index_customer_path, notice: "customer was successfully destroyed."
  end

  def orders
    @orders = Current.customer.orders
                               .filter{ |c| c.basket.date > Time.now }
                               .sort_by{ |c| c.basket.date }
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :email, :phone)
  end
end