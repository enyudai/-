class Public::SubjectsController < ApplicationController
  def index
    @subjects = Subject.where(status: true)
  end
  
  def new
    @subject = Subject.new
  end
  
  def check
    @subject = Subject.new(subject_params)
    @subject.user_id = current_user.id
    @subject.save
  end
  
  def create
    @user = current_user.id
    @subject = Subject.last
    if @subject.update(subject_params)
       redirect_to user_path(@user)
    else
      # editに遷移させる
    end
  end
  
  def show
    @subjects = Subject.where(status: true)
    @subject = @subjects.where(user_id: subject_id)
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
    # @user = current_user.id
    # subject = Subject.find(params[:id])
    # subject.destroy
    # redirect_to user_path(@user)
  end
  
  private
  
  def subject_params
    params.require(:subject).permit(:subject_image, :time_limit, :title, :theme, :user_id, :status)
  end
  
end
