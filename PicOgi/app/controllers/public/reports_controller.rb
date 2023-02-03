class Public::ReportsController < ApplicationController
  
  def new
    @report = Report.new
    @subject = Subject.find(params[:subject_id])
    @report.subject_id = @subject.id
  end
  
  def create
    @report = Report.new(report_params)
    @report.user_id = current_user.id 
    if @report.save
      redirect_to subject_path(@report.subject)
    else
      render :new
    end
  end
  
  def index
    @user = current_user
    @reports = @user.reports.page(params[:page]).per(10)
  end 
  
  private
  
  def report_params
    params.require(:report).permit(:reason, :subject_id)
  end
  
end
