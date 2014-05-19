class MyDevise::RegistrationsController < Devise::RegistrationsController

  def create
    load_user
    @user.save
    if @user.errors.any?
      render :new
    else
      @current_user = @user
      redirect_to posts_path
    end
  end


  private
    def load_user
      @user = User.new(post_params)
    end

    def post_params
      params.require(:user).permit(
        :email, :firstname, :lastname, :password, :passwrod_confirmation
      )
    end
end
