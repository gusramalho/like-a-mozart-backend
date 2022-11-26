class UsersController < ApiController
  before_action :authenticate_user, only: [:show]

  def create
    @user = User.new(user_params)

    if @user.save
      render status: :created, json: UserBlueprint.render(@user)
    else
      render status: 422, json: @user.errors
    end
  end

  def show
    render json: UserBlueprint.render(@current_user)
  end

  def login
    @user = User.find_by_email(normalize_email(params[:email]))

    unless @user.present?
      render_invalid_credentials
      return
    end

    if @user.authenticate(params[:password])
      render json: {
        id: @user.id,
        name: @user.name,
        token: JsonWebToken.encode(user_id: @user.id)
      }
    else
      render_invalid_credentials
    end
  end

  private

  def user_params
    params.permit(
      :name,
      :surname,
      :email,
      :password,
      :birthdate,
      :phone,
      :address_zip_code,
      :address_street,
      :address_number,
      :address_complement,
      :address_state,
      :address_city,
      :receive_emails
    )
  end

  def normalize_email(email)
    email&.to_s&.upcase&.strip
  end
end
