#!/usr/bin/env ruby

require 'csv'

headings = %w[Date Payee InvoiceNumber Reference
              ChargeCount Amount Status AccountCode TaxType
              TaxAmount TrackingName1 TrackingOption1 TrackingName2 TrackingOption2]

CSV.open('stripe-fees.csv', 'wb') do |csv|
  csv << headings
  CSV.foreach 'payouts.csv', :headers => true do |row|
    csv << [row['Arrival Date (UTC)'].gsub(/\s.+/, ''), 'Stripe', row[' id'], 'Stripe Fee', row[' Payment Count'],
      row['Total Fees'].gsub(/(\A-|\A)/){ |m| m == '-' ? '' : '-'}, row[' State'], '',
            '', '', '', '', '', '', '',]
  end
end

CSV.open('stripe-payments.csv', 'wb') do |csv|
  csv << headings
  CSV.foreach 'payouts.csv', :headers => true do |row|
    csv << [row['Arrival Date (UTC)'].gsub(/\s.+/, ''), 'Stripe', row[' id'], 'Stripe Payment', row[' Payment Count'],
            row['Total Gross'], row[' State'], '',
            '', '', '', '', '', '', '',]
  end
end
