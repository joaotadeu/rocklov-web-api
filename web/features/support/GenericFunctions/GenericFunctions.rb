require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'

class GenericFunctions
  include Capybara::DSL
  
  def Countdown(seconds)
    seconds.times do |i|
      print "\r-> WARN: Aguardando #{seconds - i} Segundos"
      sleep(1)
    end
    puts ''
  end

  def FindElement(elemento)
    find(elemento)
  end
  
  def UploadArquivo(file_input, elemento)
    file_input = FindElement(elemento)
    file_input.attach_file(file_input)
  end

  def AbrirPaginas(url)
    visit(url)
  end

end
