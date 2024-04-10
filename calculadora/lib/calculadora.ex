defmodule Calculadora do
  require Decimal

  def calculo(tamanho) do
    calcular_aproximacao(Decimal.new(tamanho), Decimal.new(4), Decimal.new(2), Decimal.new("3.0"))
  end

  defp calcular_aproximacao(tamanho, const, k, acc) do
    valor = Decimal.div(const, Decimal.mult(Decimal.mult(k, Decimal.add(k, Decimal.new(1))), Decimal.add(k, Decimal.new(2))))
    if Decimal.compare(tamanho, Decimal.abs(valor)) == :gt do
      acc
    else
      calcular_aproximacao(tamanho, Decimal.negate(const), Decimal.add(k, Decimal.new(2)), Decimal.add(acc, valor))
    end
  end
end

#Calculadora.calculo(Decimal.new(1,1,-20))
#Calculadora.calculo(Decimal.new(1,1,-7))
#Calculadora.calculo(Decimal.new(1,1,-8))
#Calculadora.calculo(Decimal.new(1,1,-9))
