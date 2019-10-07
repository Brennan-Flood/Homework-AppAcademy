class User < ApplicationRecord 
    validates :email, presence: true, uniqueness: true 
    validates :password, length: {minimum: 6}, allow_nil: true 
    validates :session_token, presence: true, uniqueness: true 
    validates :password_digest, presence: true 
    after_initialize :ensure_session_token 

    attr_reader :password
    # SSPIRE 

    def self.generate_session_token
      SecureRandom::urlsafe_base64(16)
    end

    def self.find_by_credentials(email, password)
      user = User.find_by(email: email)  #User.find(1)
      return nil unless user
      return nil unless user.is_password?(password)
      user
    end

    def reset_session_token!
      self.session_token = User.generate_session_token
      self.session_token
    end

    def is_password?(password)
      bcrypt_pass = BCrypt::Password.new(self.password_digest)
      bcrypt_pass.is_password?(password)
    end

    def password=(password)
      @password = password
      self.password_digest = BCrypt::Password.create(password)
    end
  
    private
    def ensure_session_token
      self.session_token ||= User.generate_session_token
    end
end 
