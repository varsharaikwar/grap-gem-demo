class Login::API < Grape::API  
    mount V1::UserLogin
  end

  