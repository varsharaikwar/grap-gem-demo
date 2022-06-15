class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Allowlist

devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self
          has_many :posts
          has_many :allowlisted_jwts
         
end
