class Public::UsersController < ApplicationController
   before_action :is_matching_login_user, only: [:edit, :update]
   before_action :ensure_guest_user, only: [:edit]
  def show
    @user = User.find(params[:id])
    @subjects = @user.subjects.where(status: true)
  end

  def index
   
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end
  
  def is_deleted
    @user = current_user
  end 
  
  def change
    @user = current_user
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @user.update!(is_deleted: true)
    reset_session
    redirect_to root_path, notice: "退会処理を実行いたしました"
  end
  
  def favorites
    @user = User.find(params[:id])
    favorites_answer_ids = Favorite.where(user_id: @user.id).pluck(:answer_id)
    @favorite_answers = Answer.where(id: favorites_answer_ids)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:nickname, :email, :profile_image, :introduction, :is_deleted)
  end
  
  def is_matching_login_user
    user_id = params[:id].to_i
    unless user_id == current_user.id
      redirect_to root_path
    end
  end
  
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.nickname == "guestuser"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end  
  
end
