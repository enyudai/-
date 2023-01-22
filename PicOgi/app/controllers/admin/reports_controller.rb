class Admin::ReportsController < ApplicationController
   #adminコントローラーを作成するた度、以下の記述
  skip_before_action :authenticate_user!
  before_action :authenticate_admin!
 
  def index
    @reports = Report.page(params[:page])
  end
 
  def show
    @report = Report.find(params[:id])
    @subject = Subject.find(params[:id])
  end
 
  def update
    @report = Report.find(params[:id])
    if @report.update(report_params)
      redirect_to admin_users_path
    else
      render :show
    end
  end
  
  def edit
  end
  
  private
  
  def report_params
    params.require(:report).permit(:report_status)
  end
  
end
