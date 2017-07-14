class UsersController < Clearance::UsersController
  before_filter :require_login, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = build_user

    if @user.save
      sign_in @user
      redirect_back_or url_after_create
    else
      render 'users/new'
    end
  end

  def edit
  end

  def update
    if current_user.update_attributes(user_params)
      redirect_to my_account_path,
        notice: t("users.flashes.update.success")
      else
        render action: :edit
    end
  end

  private

  def redirect_signed_in_users
    if signed_in?
      redirect_to :back,
        notice: t(".failure_when_signed_in")
    end
  end

  def build_user
    User.new(user_params)
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
