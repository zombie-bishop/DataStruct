class UserController < ApplicationController
  def index
    @users = User.all
    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @users }
    end
  end

  def login
  end

  def home
    @user = User.includes(:data_struct).limit(1).find(session[:user_id])
  end

  def login_attempt
    @user = User.find_or_create_by(name: params[:name], email: params[:email])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "Wow Welcome again, you logged in as #{ @user.name }"
      redirect_to(:action => 'home')
    else
      flash[:notice] = "Name and Email did not match our records"
      flash[:color]= "invalid"
      render "login"
    end
  end

  def logout
    reset_session
    redirect_to :action => 'login'
  end

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html  # show.html.erb
      format.json  { render :json => @user }
    end
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:post])
        format.html  { redirect_to(@user,
                      :notice => 'Structure was successfully updated.') }
        format.json  { head :no_content }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @user.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  def new
    @user = User.new
    respond_to do |format|
      format.html  # new.html.erb
      format.json  { render :json => @user }
    end
  end

  def create
    @user = User.new(params[:post])
    respond_to do |format|
      if @user.save
        format.html  { redirect_to(@user,
                      :notice => 'Structure was successfully created.') }
        format.json  { render :json => @user,
                      :status => :created, :location => @user }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @user.errors,
                      :status => :unprocessable_entity }
      end
    end
  end
end
