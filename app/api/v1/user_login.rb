module V1
    class UserLogin < Grape::API

        format :json
        desc 'End-points for the Login'
        resources :users do
            post "/login" do
                @user = User.find_by_email params[:user][:email]
                if @user.present? && @user.valid_password?(params[:user][:password])
                    # token = user.allowlisted_jwts.first.jti
                    @user.allowlisted_jwts
                else
                    error_msg = 'Bad Authentication Parameters'
                    error!({ 'error_msg' => error_msg }, 401)
                end
            end
        end
    end
end



