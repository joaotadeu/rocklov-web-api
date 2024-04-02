Dado('que o usuario delete informações de funcionario') do
    @get_url = HTTParty.get('http://dummy.restapiexample.com/api/v1/employees', :headers => {'Content-Type': 'application/json'})
    @delete_url = 'http://dummy.restapiexample.com/api/v1/delete/' + @get_url['data'][0]['id'].to_s
end
  
Quando('realizar o DELETE') do
    @delete_url = HTTParty.delete(@delete_url, :headers => {'Content-Type': 'application/json'})
end

Então('O status code deve retornar sucesso para delete') do
    expect(@delete_url.code).to eql 200
end