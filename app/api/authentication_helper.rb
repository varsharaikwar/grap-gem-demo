module AuthenticationHelper

      def authorize_request
        header = request.headers['Authorization']
        header = header.split(' ').last if header
        begin
          @decoded = AllowlistedJwt.find_by(jti: request.headers['Authorization'])
          @current_user = User.find_by(id: @decoded[:user_id]) if @decoded.present?
        rescue ActiveRecord::RecordNotFound => e
          render json: { errors: e.message }, status: :unauthorized
        rescue JWT::DecodeError => e
          render json: { errors: e.message }, status: :unauthorized
        end
      end
    end
    