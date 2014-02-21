class ProjectsController < ApplicationController
  def new
  	@project = Project.new
  end

  def create
  	companies = Company.all

  	domain_id = CompanyEmployee.find_by(user_id: (current_user.id))
    @project = Project.new(project_params)
    if @project.save
      flash[:success] = "Project / Strategy / Effort created succesfully!  You and your colleagues can now weigh in"
      redirect_to '#'   # @user   # todo: set this to rate the project once that exists
    else
      render 'new'
    end
  end    

  private

    def project_params
      params.require(:project).permit(:name, :domain_id)
    end

end
