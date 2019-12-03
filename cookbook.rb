puts 'Bem-vindo ao My Cookbook, sua rede social de receitas culinárias!'

puts '[1] Cadastrar uma receita'
puts '[2] Ver todas as receitas'
puts '[3] Sair'

print 'Escolha uma opção: '
opcao = gets.to_i
receitas = []

while opcao != 3
  if opcao == 1
    print 'Digite o nome da sua receita: '
    nome = gets.chomp
    puts "Receita de #{nome} cadastrada com sucesso!"
    receitas << nome
  elsif opcao == 2
    receitas.each_with_index do |receita, index|
      puts "##{index + 1} - #{receita}"
    end
    puts 'Nenhuma receita cadastrada' if receitas.empty?
  else
    puts 'Opção inválida'
  end

  puts '[1] Cadastrar uma receita'
  puts '[2] Ver todas as receitas'
  puts '[3] Sair'

  print 'Escolha uma opção: '
  opcao = gets.to_i
end

puts 'Obrigado por usar o Cookbook'
