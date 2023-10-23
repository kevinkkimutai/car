class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates :fullname, presence: true
    validates :role, presence: true
  
    enum role: { student: 0, admin: 1}
  
    # Method to check if user has admin role
    def admin?
      role == 'admin' # Compare with enum value :admin instead of integer value 1
    end
  
    def attributes
      super.merge('role' => role)
    end
  
    def generate_reset_password_token
      self.reset_password_token = SecureRandom.urlsafe_base64
      self.reset_password_token_expires_at = 1.hour.from_now
    end
  
    def reset_password_token_valid?
      reset_password_token.present? && reset_password_token_expires_at.present? && reset_password_token_expires_at > Time.now
    end
end
  