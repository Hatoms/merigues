class Customer < ApplicationRecord
  has_many :orders
  has_many :baskets, through: :orders
  
  before_save :downcase_email
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}, presence: true, uniqueness: true
  # validates email

  # has_secure_password

  def downcase_email
    self.email = email.downcase
  end
  
end