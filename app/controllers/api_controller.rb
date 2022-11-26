class ApiController < ActionController::API

  def authenticate_user
    token = http_authorization_header

    unless token.present?
      render_unauthorized 
      return
    end 

    token_data = JsonWebToken.decode(token)

    unless token_data.present?
      render_invalid_credentials 
      return
    end

    if token_data[:expiration] < Time.now.to_f
      render_token_expired
      return 
    end 
      
    @current_user = User.find(token_data[:user_id])
  
    render_unauthorized unless @current_user
  end

  def http_authorization_header
    auth_header = request.headers["Authorization"]

    if auth_header.present?
      return auth_header.split(" ").last
    end

    return nil
  end

  def render_unauthorized
    render status: 401, json: {
      error: "Not Authorized"
    }
  end

  def render_invalid_credentials
    render status: 401, json: {
      error: "Invalid credentials"
    }
  end

  
  def render_token_expired
    render status: 401, json: {
      error: "Token expired"
    }
  end
end
