# frozen_string_literal: true
require 'bundler'
Bundler.require :test

SimpleCov.start do
  add_filter '/gems/'
  add_filter '/spec/shared_context/'
end

Dir['./spec/shared_context/**/*.rb'].sort.each { |f| require f }
require 'polynomials_differentiator'
include PolynomialsDifferentiator

RSpec.configure do |config|
  config.color = true
end
