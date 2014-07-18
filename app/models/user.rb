class User
  include Mongoid::Document
  # Include default devise modules
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  ## Database authenticatable
  field :name,               type: String, default: ""
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""

  ## Rememberable
  field :remember_created_at, type: Time

  before_validation :generate_password, :on => :create
  after_create :notify_creation

  def generate_password
    self.password = self.password_confirmation = Devise.friendly_token.first(8)
  end

  def notify_creation
    UserMailer.welcome(self).deliver
  end

end
