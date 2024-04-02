Dado('que o usuario altere informações de funcionario') do
    @get_url = HTTParty.get('http://dummy.restapiexample.com/api/v1/employees', :headers => {'Content-Type': 'application/json'})
    @put_url = 'http://dummy.restapiexample.com/api/v1/update/' + @get_url['data'][1]['id'].to_s
end

Quando('realizar o PUT') do
    @update_employee = HTTParty.put(@put_url, :headers => {'Content-Type': 'application/json'}, body: {
                    "employee_name": "Diana",
                    "employee_salary": 100,
                    "employee_age": 26,
                    "profile_image": ""
            }.to_json)
end

Então('O status code deve retornar sucesso para alterações alteradas') do
   expect(@update_employee.code).to eql 200
   expect(@update_employee.msg).to eql 'OK'
   expect(@update_employee["status"]).to eql 'success'
end