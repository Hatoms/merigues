class SessionsController < ApplicationController
    def new; end
    def create
      customer = Customer.find_by(email: params[:email])
      # finds existing customer, checks to see if customer can be authenticated
      if customer.present?# && customer.authenticate(params[:password])
      # sets up customer.id sessions
        session[:customer_id] = customer.id
        redirect_to root_path, notice: 'Logged in successfully'
      else
        flash.now[:alert] = 'Invalid email or password'
        render :new
      end
    end

    def create_admin
      customer = Customer.find_by(email: params[:email])
      # finds existing customer, checks to see if customer can be authenticated
      if customer.present? && customer.authenticate(params[:password])
      # sets up customer.id sessions
        session[:customer_id] = customer.id
        redirect_to root_path, notice: 'Logged in successfully'
      else
        flash.now[:alert] = 'Invalid email or password'
        render :login
      end
    end

    def sign_in_admin
      @customer = Customer.find_by(email: params[:customer][:email].downcase)
      unless @customer.present? && @customer.admin?
        flash.now[:alert] = "Not admin email"
        redirect_to customer_login_admin_path, status: :unprocessable_entity
        return true
      end
      if @customer.password == params[:customer][:password]
        session[:customer_id] = @customer.id
        redirect_to root_path, notice: "Signed in."
      else
        flash.now[:alert] = "Incorrect password."
        render 'customers/login_admin', status: :unprocessable_entity
      end
    end

    def sign_in
        session[:customer_id] = params[:id]
        redirect_to root_path
    end

    def destroy
      # deletes customer session
      session[:customer_id] = nil
      redirect_to root_path, notice: 'Logged Out'
    end
end