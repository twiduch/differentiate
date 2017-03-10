module PolynomialsDifferentiator
  class Calculator
    attr_accessor :coef, :diff_coef

    def initialize
      self.diff_coef = []
    end

    def result
      prepare_diff_coefficients
      stringify_output
    end

    private

    def prepare_diff_coefficients
      coef.each_with_index { |coef, i| self.diff_coef << coef * i }
      diff_coef.shift
    end

    def data=(raw_data)
      self.coef = raw_data.split('/').map!(&:to_i).reverse
    end

    def stringify_output
      elements = []
      diff_coef.each_with_index do |difc, i|
        next if difc == 0
        elements << "#{difc}" + exponent(i)
      end
      elements.reverse.join('+').gsub('+-','-')
    end

    def exponent(i)
      case i
      when 0 then ''
      when 1 then 'x'
      else "x^#{i}"
      end
    end
  end
end