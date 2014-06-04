class UsersController < ApplicationController
  layout 'admin'

  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    @user.user_id = get_new_user_id
    @user.password = get_new_user_id
    respond_to do |format|
      if @user.save
        @user.create_account(account_number: get_new_account_number)
        format.html { redirect_to admin_dashboard_index_path, notice: "ser was successfully created. Your User ID is #{@user.user_id} and passward #{@user.password}" }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to admin_dashboard_index_path, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to admin_dashboard_index_path }
      format.json { head :no_content }
    end
  end

  private
  def get_new_account_number
    account = Account.last
    account.present? ? (account.account_number.to_i + 1) : 2001001
  end

  def get_new_user_id
    user = User.find(:last, :conditions => [ "role != ?", "admin" ])
    user.present? ? user.user_id.to_i + 3 : 150801
  end

end
