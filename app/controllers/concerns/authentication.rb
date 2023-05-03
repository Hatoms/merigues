module Authentication
    extend ActiveSupport::Concern
  
    included do
      before_action :current_customer
      helper_method :current_customer
      helper_method :require_admin_logged_in!
    end
  
    def login(customer)
      reset_session
      session[:customer_id] = customer.id
      current_customer
    end
  
    def logout
      reset_session
    end
  
  
    private
  
    def current_customer
      Current.customer ||= session[:customer_id] && Customer.find_by(id: session[:customer_id])
    end
  
    def require_admin_logged_in!
    # allows only logged in customer
    unless Current.customer && Current.customer.admin
        redirect_to root_path, alert: 'You must be admin'
    end
    end
  
  end