class Backoffice::AdminsController < BackofficeController
  before_action :set_admin, only: [:edit, :update, :destroy]
  
  def index
    #@admin = Admin.all
    @admin = Admin.with_full_access
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(params_admin)
    if @admin.save 
      redirect_to backoffice_admins_path, notice: "Save Successful."
    else
      render :new
    end
  end
  
  def edit 
  end
  
  def update
    passwd = params[:admin][:password]
    passwd_confirm = params[:admin][:password_confirmation]
    
    if passwd.blank? && passwd_confirm.blank?
      params[:admin].delete(:password)
      params[:admin].delete(:password_confirmation)      
    end    

    if @admin.update(params_admin)
      redirect_to backoffice_admins_path, notice: "Update Successful."
    else
      render :edit
    end

  end

  def destroy
    if @admin.destroy
      redirect_to backoffice_admins_path, notice: "Delete Successful."
    else
      render :index
    end
  end



private

  def params_admin
    params.require(:admin).permit(:email, :password, :password_confirmation, :name)
  end
  
  def set_admin
    @admin = Admin.find(params[:id])  
  end
  
end
