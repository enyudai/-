class Public::ReportsController < ApplicationController
  def new
    @report = Report.new
    @subject = Subject.find(params[:subject_id])
    # @answer = Answer.find(params[:answer_id])
  end
  
  def create
    # @report = Report.new(report_params)
    # @report.user_id = current_user.id 
    # # 通報が投稿に対するものか、回答に対するものか条件分岐する
    # if params.key = 'subject'
    #   @report.subject_id = @subject.id
    # else
    #   @report.answer_id = @answer.id
    # end
    
    # if @report.save
    #   redirect_to subject_path(@subject)
    # else
    #   render :new
    # end
    
    @subject = Subject.find(params[:subject_id])
    # @answer = Answer.find(params[:answer_id])
    @report = Report.new(report_params)
    @report.user_id = current_user.id 
    @report.subject_id = @subject.id
    # @report.answer_id = @answer.id
    if @report.save
      redirect_to subject_path(@subject)
    else
      render :new
    end
  end
  
  def index
    @user = current_user
    @reports = @user.reports
    # @subject = Subject.find(params[:id])
  end 
  
  private
  
  def report_params
    params.require(:report).permit(:reason)
  end
  
end
