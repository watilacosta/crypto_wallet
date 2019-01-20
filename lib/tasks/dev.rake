namespace :dev do
  desc "Deleta o banco de dados e cria um novo com migrates e seeds."
  task setup: :environment do
    if Rails.env.development?
      show_spinner('Deletando o DB') { %x(rails db:drop) }  
      show_spinner('Recriando o DB') { %x(rails db:create) }
      show_spinner('Executando as migrates') { %x(rails db:migrate) }
      show_spinner('Executando seeds') { %x(rails db:seed) }
    else 
      puts "Fora do ambiente de Desenvolvimento!"
    end
  end

  private

  def show_spinner(msg_inicio, msg_fim = "OK")
    spinner = TTY::Spinner.new("[:spinner] #{msg_inicio} ...")
    spinner.auto_spin
    yield
    spinner.success("\n\n(#{msg_fim}!)")
  end
end
