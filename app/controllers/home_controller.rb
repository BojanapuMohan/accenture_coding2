class HomeController < ApplicationController
  skip_authorization_check

  def index
    @employees = Employee.all
    if current_user.present?
      if current_user.ceo?
        #@tests = Test.all
        #@report_tests = StudentTest.select(:test_id).uniq
        @employees = Employee.all
        render "index"
      elsif current_user.employee?
        #
        @employees = Employee.all
        #@current_test_id = Test.find_by_status("activated")
        #if Test.find_by_status("activated") and !StudentTest.where(status: "completed", user_id: current_user.id, test_id: @current_test_id).present?
        #  @current_test = Test.find(@current_test_id)
        #else
        #  @current_test_id = nil
        #end
        #@student_completed_tests = StudentTest.where(status: "completed", user_id: current_user.id).order("created_at ASC")


        #=end
        render "index"
      end    
    end
    
  end

end
