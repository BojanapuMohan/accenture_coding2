json.array!(@employees) do |employee|
  json.extract! employee, :id, :id, :name, :salary, :report_to
  json.url employee_url(employee, format: :json)
end
