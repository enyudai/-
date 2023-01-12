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
    @subject = Subject.find(params[:id])
    @answer = Answer.new
  end
  
  def edit
    @subject = Subject.find(params[:id])
  end
  
  def update
    @subject = Subject.find(params[:id])
    if @subject.update(subject_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end
  
  def destroy
     subject = Subject.find(params[:id])
     subject.destroy
     redirect_to user_path(current_user.id)
  end
  
  private
  
  def subject_params
    params.require(:subject).permit(:subject_image, :time_limit, :title, :theme, :user_id, :status)
  end
  
end
