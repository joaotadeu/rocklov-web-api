Dado('que o usuario consulte informações de funcionario') do
    @get_url = "http://dummy.restapiexample.com/api/v1/employees" 
end
  
Quando('realizar o GET') do
    @list_employee = HTTParty.get(@get_url)
end
  
Então('O status code deve retornar 200') do
  expect(@list_employee.code).to eql 200
  expect(@list_employee.message).to eql 'OK'
end