module ApplicationHelper

  def flash_alert_class(key)
    p "-----------" + key.to_s
    key = 'danger' if key == :error or key == "alert"
    key = 'success' if key == "notice"
    alert_class = ["alert"]
    if key.to_s == "fail"
      alert_class << "alert-danger"
    elsif key == :notice
      alert_class << "alert-info"
    else
      alert_class << "alert-#{key}"
    end
    alert_class.join(" ")
  end

  def hierarchy_list(employees)
    p "hierarchy_list =================="
    array = Array.new
    root = Hash.new
    employees.each do |e|
      hashMap = Hash.new
      hashMap["id"] = e.id
      hashMap["name"] = e.name
      hashMap["salary"] = e.salary
      hashMap["report_to"] = e.report_to
      hashMap["role"] = e.role
      hashMap["children"] = []
      if !e.report_to
        root = hashMap
      end
      array.push(hashMap);
    end 

    return  array #nestedHashmap(array)
    #employees.each do |e|
    #  uiString += "<li class='list-group-item'>" + e.name + '(' + e.role + ')';
    #end
    #uiString
  end





  

end
