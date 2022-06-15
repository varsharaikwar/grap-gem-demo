class UserRegistrationWithMobileNumberService
  attr_reader :email, :password, :name, :token

  def initialize(email, password, name)
    @email = email
    @password = password
    @name = name
  end

  def register
    user = User.new(email: @email, password: @password, name: @name)
    if user.save
      @token, payload = Warden::JWTAuth::UserEncoder.new.call(user, :user, nil)
     token = user.on_jwt_dispatch(@token, payload)
    end
    user
  end
end

