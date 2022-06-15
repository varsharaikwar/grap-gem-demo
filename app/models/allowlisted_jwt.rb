class AllowlistedJwt < ApplicationRecord
    SECRET_KEY = "235e3cfa78cfe515b1b3acfd47333ace85ae91c6b23c5577a9e60fec4fa4c94a29f3c7dae353ecbd9430699a3b7b71639ffa8c38803fd6e5bb304b85c685b84c"

    def self.encode(payload)
    #   payload[:exp] = exp.to_i
      JWT.encode(payload, SECRET_KEY)
    end
  
    def self.decode(token)
      decoded = JWT.decode(token, SECRET_KEY)[0]
    #   HashWithIndifferentAccess.new decoded
    end
 belongs_to :user
end
