class ProjectsController < ApplicationController

  def index
    #    @users = current_user.company.users.paginate(page: params[:page])  

    @projects = current_user.company.projects.paginate(page: params[:page])
    @project = Project.new   # need this for creating new on index page
  end

  def show
    @project = Project.find(params[:id])
    # @microposts = @user.microposts.paginate(page: params[:page])
  end

  def new
  	@project = Project.new
  end

  def create
    # do I need the next 2 lines?
  	# companies = Company.all
  	# domain_id = CompanyEmployee.find_by(user_id: (current_user.id))  # would now be company_id
    
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
      params.require(:project).permit(:name, :company_id)
    end

end
