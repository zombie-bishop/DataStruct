class DataStructController < ApplicationController
  def index
    @data_structs = DataStruct.all
    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @data_structs }
    end
  end

  def show
    @data_struct = DataStruct.find(params[:id])
    respond_to do |format|
      format.html  # show.html.erb
      format.json  { render :json => @data_struct }
    end
  end

  def user_data_struct
    @data_struct = DataStruct.find_by(user_id: params[:user_id])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @users}
      format.json { render json: @data_struct}
    end
  end

  def update
    @data_struct = DataStruct.find(params[:id])
    respond_to do |format|
      if @data_struct.update_attributes(params[:post])
        format.html  { redirect_to(@data_struct,
                      :notice => 'Structure was successfully updated.') }
        format.json  { head :no_content }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @data_struct.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  def new
    @data_struct = DataStruct.new
    respond_to do |format|
      format.html  # new.html.erb
      format.json  { render :json => @data_struct }
    end
  end

  def create
    @data_struct = DataStruct.new(params[:post])
    respond_to do |format|
      if @data_struct.save
        format.html  { redirect_to(@data_struct,
                      :notice => 'Structure was successfully created.') }
        format.json  { render :json => @data_struct,
                      :status => :created, :location => @data_struct }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @data_struct.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

end
