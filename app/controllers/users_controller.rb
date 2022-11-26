class UsersController < ApiController

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user
    else
      render status: 422, json: @user.errors
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
end
