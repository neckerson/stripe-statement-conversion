# Stripe Xero Conversion
A ruby script for converting stripe .csv statements for import into Xero,
following the reccomended Xero CSV template.

The script accepts payouts.csv (available from the Balance > Payouts menu) and outputs stripe-fees.csv (containing all transaction fees) and stripe-payments.csv (containing all transaction amounts).

# Notes
Stripe has recently changed their back-end interface, allowing you to export
specific fields into the CSV.

To use this script, click Balance > Payouts > Export and under the Columns
drop-down menu, check the boxes for ID, Amount, Arrival Date (UTC), Total Gross and Total
Fees.
