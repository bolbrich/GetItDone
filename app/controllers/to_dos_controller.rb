class ToDosController < ApplicationController

  def index
    @to_dos = ToDo.all
  end
  
  def done
    @to_dos = ToDo.done
  end
  
  def outstanding
    @to_dos = ToDo.outstanding
  end

  def show
    @project = Project.find(params[:project_id])
    @to_do = @project.to_dos.find(params[:id])
	
	@todolist = @project.to_dos.outstanding.order('to_dos.deadline ASC').limit(20)
	
	@title = @project.title
  end

  def new
    @project = Project.find(params[:project_id])
    @to_do = ToDo.new
	@title = "Neue Aufgabe erstellen"
  end

  def edit
    @project = Project.find(params[:project_id])
    @to_do = @project.to_dos.find(params[:id])
	@title = "Aufgabe bearbeiten"
  end
  
  def create
    @project = Project.find(params[:project_id])
	@to_do = @project.to_dos.new(params[:to_do])

    if @to_do.save
      redirect_to [@project, @to_do]
    else
       render action: 'new'
    end
  end

  def update
    @project = Project.find(params[:project_id])
    @to_do = @project.to_dos.find(params[:id])

    if @to_do.update_attributes(params[:to_do])
      redirect_to [@project, @to_do]
    else
      render action: 'edit'
    end
  end

  def destroy
    @to_do = ToDo.find(params[:id])
    @to_do.destroy

    redirect_to projects_path
  end
  
end
