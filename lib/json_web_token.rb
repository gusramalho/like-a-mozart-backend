class JsonWebToken
  class << self
    def encode(payload, exp = 24.hours.from_now)
      payload[:expiration] = exp.to_i
      JWT.encode(payload, ENV["JWT_SECRET"] || Rails.application.secrets.secret_key_base)
    end
 
    def decode(token)
      body = JWT.decode(token, ENV["JWT_SECRET"] || Rails.application.secrets.secret_key_base)[0]
      HashWithIndifferentAccess.new body
    rescue
      nil
    end
  end
 end
