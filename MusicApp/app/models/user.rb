class User < ActiveRecord::Base
   after_initialize :ensure_session_token
   before_create :ensure_activation_token
   validates :email, :session_token, :password_digest, presence: true
   validates :password, length: { minimum: 6, allow_nil: true }

   has_many :notes
   attr_reader :password

   def self.find_by_credentials(email, password)
      user = User.find_by(email: email)
      return nil unless user
      return user if user.is_password?(password)
   end

   def self.generate_session_token
      SecureRandom.base64
   end

   def ensure_activation_token
      self.activation_token ||= SecureRandom.urlsafe_base64
   end

   def reset_session_token!
      self.session_token = User.generate_session_token
      self.save
   end

   def password=(password)
      @password = password
      self.password_digest = BCrypt::Password.create(password)
   end

   def is_password?(password)
      BCrypt::Password.new(self.password_digest).is_password?(password)
   end

   private
   def ensure_session_token
      self.session_token ||= User.generate_session_token
   end


end
