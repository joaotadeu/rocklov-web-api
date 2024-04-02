Dado('que o usuario cadastre novas informações de funcionario') do
    @post_url = "http://dummy.restapiexample.com/api/v1/create" 
end
  
Quando('realizar o POST') do
    @create_employee = HTTParty.post(@post_url, :headers => {'Content-Type': 'application/json'}, body: {
                    "id": 33,
                    "employee_name": "Diana",
                    "employee_salary": 420800,
                    "employee_age": 27,
                    "profile_image": ""
            }.to_json)
end

Então('O status code deve retornar sucesso') do
   expect(@create_employee.code).to eql 200
   expect(@create_employee.msg).to eql 'OK'
   expect(@create_employee["status"]).to eql 'success'
   expect(@create_employee.parsed_response["data"]["employee_name"]).to eql 'Diana'
end