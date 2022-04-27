# frozen_string_literal: true

class Report
  require 'csv'

  DATA_PATH = 'data.csv'
  EXPENSES = {
    transportation: {
      normal: 0.12,
      discount: 0.08,
      num_discount: 100
    },
    meal: {
      normal: 10,
      discount: 6,
      num_discount: 3
    },
    parking: {
      normal: 1,
      discount: 0.5,
      num_discount: 20
    }
  }.freeze

  def initialize
    @expenses = {}
    EXPENSES.each_key do |concept|
      @expenses[concept] = 0
    end
  end

  def calculate
    data = CSV.read DATA_PATH
    data.each do |concept, units|
      add_expense(concept, units.to_i)
    end
    calculate_refund
  end

  private

  def add_expense(concept, units)
    @expenses[concept.to_sym] += units
  end

  def calculate_refund
    total = 0
    @expenses.each do |concept, units|
      discount_refund = units - EXPENSES[concept][:num_discount] if units > EXPENSES[concept][:num_discount]
      total += EXPENSES[concept][:normal] * (units - discount_refund)
      total += EXPENSES[concept][:discount] * discount_refund
    end
    total
  end
end
