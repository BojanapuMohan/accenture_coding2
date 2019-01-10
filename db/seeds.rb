

 user = User.create(:name => "CEO", :role => "CEO", :email => "ceo@example.com" , :password => "hellohello"
                  )  
user = User.create(:name => "VP", :role => "VP", :email => "vp@example.com" , :password => "hellohello"
 ) 
user = User.create(:name => "Director", :role => "Director", :email => "director@example.com" , :password => "hellohello"
 ) 
user = User.create(:name => "Manager", :role => "Manager", :email => "manager@example.com" , :password => "hellohello"
 ) 
user = User.create(:name => "SDE", :role => "SDE", :email => "sde@example.com" , :password => "hellohello"  
 ) 

employee = Employee.create(:id => "000010", :role => "CEO", :name=>"Mohan", :salary => '100000', report_to => null   
 ) 


#insert into employees (id, role, name, salary,created_at, updated_at) values ('000001', 'CEO', 'Mohan', 100000, now(), now());