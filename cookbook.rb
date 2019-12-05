require_relative 'receita'

INSERIR_RECEITA = 1.freeze
VISUALIZAR_RECEITA = 2.freeze
PESQUISAR_RECEITA = 3.freeze
SAIR = 4.freeze

def bem_vindo()
  'Bem-vindo ao My Cookbook, sua rede social de receitas culinárias!'
end

def menu()
  puts "[#{INSERIR_RECEITA}] Cadastrar uma receita"
  puts "[#{VISUALIZAR_RECEITA}] Ver todas as receitas"
  puts "[#{PESQUISAR_RECEITA}] Pesquisar receitas"
  puts "[#{SAIR}] Sair"

  print 'Escolha uma opção: '
  gets().to_i()
end

def inserir_receita
  print 'Digite o nome da sua receita: '
  nome = gets.chomp
  print 'Digite o tipo da sua receita: '
  tipo = gets.chomp
  puts "Receita de #{nome} do tipo #{tipo} cadastrada com sucesso!"
  Receita.new(tipo: tipo, nome: nome)
end

def imprimir_receitas(receitas)
  receitas.each_with_index do |receita, index|
    puts "##{index + 1} - #{receita}"
  end
  puts 'Nenhuma receita cadastrada' if receitas.empty?
end

def buscar_receitas(receitas)
  print 'Digite uma palavra para procurar: '
  busca = gets.chomp
  receitas_encontradas = Receita.busca(receitas, busca)
  puts receitas_encontradas
  puts 'Nenhuma receita encontrada' if receitas_encontradas.empty?
end

puts bem_vindo()

opcao = menu()
receitas = Receita.load

while opcao != SAIR
  if opcao == INSERIR_RECEITA
    receitas << inserir_receita
  elsif opcao == VISUALIZAR_RECEITA
    imprimir_receitas(receitas)
  elsif opcao == PESQUISAR_RECEITA
    buscar_receitas(receitas)
  else
    puts 'Opção inválida'
  end

  opcao = menu
end

Receita.save(receitas)
puts 'Obrigado por usar o Cookbook'