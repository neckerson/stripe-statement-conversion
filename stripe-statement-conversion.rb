#!/usr/bin/env ruby

require 'csv'

headings = ["Date", "Amount", "Payee", "Description", "Reference", "Check Number"]

CSV.open('stripe-fees.csv', 'wb') do |csv|
  csv << headings
  CSV.foreach 'payouts.csv', :headers => true do |row|
    csv << [row['Arrival Date (UTC)'].gsub(/\s.+/, ''),
            row['Total Fees'].gsub(/(\A-|\A)/){ |m| m == '-' ? '' : '-'},
            'Stripe',
            'Stripe Fee',
            row['id']]
  end
end

CSV.open('stripe-payments.csv', 'wb') do |csv|
  csv << headings
  CSV.foreach 'payouts.csv', :headers => true do |row|
    csv << [row['Arrival Date (UTC)'].gsub(/\s.+/, ''),
            row['Total Gross'],
            'Stripe',
            'Stripe Payment',
            row['id']]
  end
end
