class Backoffice::AdminsController < BackofficeController
  before_action :set_admin, only: [:edit, :update, :destroy]
  after_action :verify_authorized, only: [:new, :destroy]
  after_action :verify_policy_scoped, only: :index
  
  def index
    #@admin = Admin.all
    #@admin = Admin.with_full_access
    #@admin = Admin.with_restricted_access
    @admin = policy_scope(Admin)
  end

  def new
    @admin = Admin.new
    authorize @admin
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
    if @admin.update(params_admin)
      AdminMailer.update_email(current_admin, @admin).deliver_now
      redirect_to backoffice_admins_path, notice: "Update Successful."
    else
      render :edit
    end

  end

  def destroy
    authorize @admin
    if @admin.destroy
      redirect_to backoffice_admins_path, notice: "Delete Successful."
    else
      render :index
    end
  end



private

  def params_admin
    passwd = params[:admin][:password]
    passwd_confirm = params[:admin][:password_confirmation]
    
    if passwd.blank? && passwd_confirm.blank?
      params[:admin].delete(:password)
      params[:admin].delete(:password_confirmation)      
    end  

    if @admin.blank?
      params.require(:admin).permit(:email, :password, :role, :password_confirmation, :name)
    else
      params.require(:admin).permit(policy(@admin).permitted_attributes)
    end
  end
  
  def set_admin
    @admin = Admin.find(params[:id])  
  end
  
end
