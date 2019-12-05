class Receita
  attr_accessor :nome, :tipo

  def initialize(nome, tipo)
    @nome = nome
    @tipo = tipo
  end

  def to_s
    "#{nome} - #{tipo}"
  end
end