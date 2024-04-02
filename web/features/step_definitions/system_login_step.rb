Given("that administrador credentials are resgisted in the system") do
    @admin_names = ['admin','administrador','menager']
    @admin_passwords = ['@123','#123','$123']
end
  
When("I log in using username {string} and password {string}") do |username, password|
  @result = false
  if @admin_names.include?(username) and @admin_passwords.include?(password)
        @result = true
  end
end
  
Then("login is successfull") do
    expect(@result).to eq(true)
end