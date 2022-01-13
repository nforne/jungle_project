class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, presence: true, confirmation: true, length: {minimum: 4}

  def self.authenticate_with_credentials(email, password)
    if @user = User.find_by(email: email)&.authenticate(password)
      return @user
    else
      return nil
    end
  end

end
