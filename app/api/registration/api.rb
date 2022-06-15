class Registration::API < Grape::API
    helpers AuthHelpers
    helpers do
      def unauthorized_error!
        error!('Unauthorized', 401)
      end
    end
  
    mount V1::UserRegistration
  end

  