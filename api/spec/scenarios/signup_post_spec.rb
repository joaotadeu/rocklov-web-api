require "routes/signup"
require "routes/sessions"
require "routes/equipos"

require "libs/mongo"
require "helpers"

describe "POST /signup" do
  context "novo usuario" do
    before(:all) do
      payload = { name: "Diana Anjos", email: "Diana@gmail.com", password: "123" }
      MongoDB.new.remove_user(payload[:email])

      @result = Signup.new.create(payload)
    end

    it "valida status code" do
      expect(@result.code).to eql 200
    end

    it "valida id do usuário" do
      expect(@result.parsed_response["_id"].length).to eql 24
    end
  end

  context "usuario ja existe" do
    before(:all) do
      # dado que eu tenho um novo usuario
      payload = { name: "João da Silva", email: "joao@ig.com.br", password: "pwd123" }
      MongoDB.new.remove_user(payload[:email])

      # e o email desse usuário ja foi cadastrado no sistema
      Signup.new.create(payload)

      # quando faço uma requisição para a rota /signup
      @result = Signup.new.create(payload)
    end

    it "deve retornar 409" do
      # entao deve retornar 409
      expect(@result.code).to eql 409
    end

    it "deve retornar mensagem" do
      expect(@result.parsed_response["error"]).to eql "Email already exists :("
    end
  end

  # name é obrigatório
  # email é obrigatório
  # password é obrigatório

end
