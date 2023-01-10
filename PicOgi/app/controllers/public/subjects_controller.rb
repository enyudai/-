class Public::SubjectsController < ApplicationController
  def index
    @subjects = Subject.where(status: true)
  end
  
  def new
    @subject = Subject.new
  end
  
  def check
    #byebug
    @subject = Subject.new(subject_params)
    @subject.user_id = current_user.id
    @subject.save
    #byebug
    #@test = params[:subject][:subject_ige]
  end
  
  def create
    #byebug
    @subject = Subject.last
    byebug
    if @subject.update(subject_params)
       redirect_to user_path(@user)
    else
      # editに遷移させる
     end
    # if @subject.update
    #   redirect_to user_path(@user)
    # else 
    #   render :new
    # end
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  
  def subject_params
    params.require(:subject).permit(:subject_image, :time_limit, :title, :theme, :user_id, :status)
  end
  
end
