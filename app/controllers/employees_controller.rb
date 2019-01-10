class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  #before_action :check_employee, only: [:new,:create]

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new

  end

  # GET /employees/1/edit
  def edit
  end

  def hierarchy
    @employees = Employee.all.to_a

  end

  def top
    @employees = Employee.all.order("salary DESC").limit(10)
    
  end
  
  # POST /employees
  # POST /emplosal.json
  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|

      flag = check_employee(employee_params);
      sdeUser = isSDEUser(employee_params);

      if sdeUser && flag && @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
         @employee = Employee.new(employee_params)
        if (!sdeUser)
          format.html { redirect_to @employee, alert: 'Unable to Save Employee Details Change Report to Name' }
        elsif(!flag) 
        format.html { redirect_to @employee, alert: 'Unable to Save Employee Details Employee id uniq' }
        end
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    def check_employee(params)
     
      begin
        @employee = Employee.find(params[:id]);
       
        if @employee == nil
          return true
        else  
        return false
        end
      rescue ActiveRecord::RecordNotFound => e
        return true
      end
    end


    def isSDEUser(params)
      begin
       @employee1 = Employee.where("id = '"+params[:report_to]+"' and role= 'SDE'");
       count = @employee1.length
        if @employee1 == nil || count == 0
          return true
        else  
        return false
        end
      rescue ActiveRecord::RecordNotFound => e
        return true
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:id, :name, :salary, :report_to,:role)
    end
end
