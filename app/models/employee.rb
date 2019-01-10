class Employee < ActiveRecord::Base

	def isSDEUser(params)
		@employee = Employee.where("id = '"+params[:report_to]+"'");

		return @employee[:role] == 'SDE'
	end
end
