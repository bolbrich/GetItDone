class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
	@title = @user.user_name
	
	@projects = @user.projects
	@worklist = @projects.work.order('projects.title ASC').limit(20)
	@studylist = @projects.study.order('projects.title ASC').limit(20)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to new_session_path, :notice => "Signed up!"
    else
      render "new"
    end
  end

	def edit
    @user = User.find(params[:id])
  end
	
	def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
	
end
