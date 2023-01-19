class Admin::SubjectsController < ApplicationController
  #adminコントローラーを作成するた度、以下の記述
  skip_before_action :authenticate_user!
  before_action :authenticate_admin!
  
    def show
      @subject = Subject.find(params[:id])
      @subject_tags = @subject.tags
    end
    
    def destroy
         subject = Subject.find(params[:id])
         subject.destroy
        redirect_to admin_users_path
    end
    
end
