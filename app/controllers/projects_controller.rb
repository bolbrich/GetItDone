class ProjectsController < ApplicationController

  def index
    @projects = current_user.projects.includes(:to_dos).where(['to_dos.done = ?', false]).order('to_dos.deadline ASC').limit(6)

	@title = "Dashboard"
  end
  
  def work
    @projects = current_user.projects.work
	
	@title = "Projekte"
  end
  
  def study
    @projects = current_user.projects.study
	
	@title = "Lehrveranstaltungen"
  end
	
  def show
    @project = Project.find(params[:id])

	@to_dos = @project.to_dos.limit(10)
	@worklist = current_user.projects.work.order('projects.title ASC').limit(20)
	@studylist = current_user.projects.study.order('projects.title ASC').limit(20)
	
	@title = @project.title
  end
  
  def todos
    @project = current_user.projects.find(params[:id])
	@to_dos = @project.to_dos

	@worklist = current_user.projects.work.order('projects.title ASC').limit(20)
	@studylist = current_user.projects.study.order('projects.title ASC').limit(20)

	@title = @project.title
  end
  
  def time 
    @project = current_user.projects.find(params[:id])
	@to_dos = @project.to_dos
	
	@worklist = current_user.projects.work.order('projects.title ASC').limit(20)
	@studylist = current_user.projects.study.order('projects.title ASC').limit(20)
    
	@title = @project.title
  end 

  def new
    @project = current_user.projects.new
  end

  def edit
    @project = current_user.projects.find(params[:id])
  end

  def create
    @project = Project.new(params[:project])
	
    if @project.save
      redirect_to @project
    else
      render "new"
    end
  end

  def update
    @project = current_user.projects.find(params[:id])

    if @project.update_attributes(params[:project])
      redirect_to @project
    else
      render "edit"
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to projects_url
  end
  
end
