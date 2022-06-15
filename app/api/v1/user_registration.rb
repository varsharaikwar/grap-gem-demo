module V1
  class UserRegistration < Grape::API
    before do
      @user_mobile_number = UserRegistrationWithMobileNumberService.new params[:user][:email], params[:user][:password], params[:user][:name]
    end

    # set response headers
    after do
      header 'Authorization', @user_mobile_number.token
    end
    resources :users do
      post do
        @user_mobile_number.register
      end
      put :verify do
        current_user.verify(params[:code])
      end
    end
  end
end
