module PolynomialsDifferentiator
  class Calculator
    attr_accessor :coef, :diff_coef #enumerators

    def result
      prepare_diff_coefficients
      stringify_output
    end

    def data=(raw_data)
      self.coef = raw_data.split('/').map(&:to_i).reverse[1..-1].to_enum
    end

    private

    def prepare_diff_coefficients
      self.diff_coef = coef.with_index(1).map { |coef, i| coef * i }.to_enum
    end

    def stringify_output
      diff_coef_components.reverse.join('+').gsub('+-','-')
    end

    def diff_coef_components
      diff_coef.with_index.map do |difc, i|
        next if difc == 0
        difc.to_s + exponent(i)
      end.compact
    end

    def exponent(i)
      return '' if i == 0
      i > 1 ? "x^#{i}" : 'x'
    end
  end
end