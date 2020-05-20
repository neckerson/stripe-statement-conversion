# Stripe Xero Conversion
A ruby script for converting stripe .csv statements for import into Xero,
following the recommended Xero CSV template.

The script accepts `payouts.csv` (available from the Balance > Payouts menu) and
outputs `stripe-fees.csv` (containing all transaction fees) and
`stripe-payments.csv` (containing all transaction amounts).

This script is much faster than the process Xero shows for manually importing
historical Stripe transactions!

https://central.xero.com/s/article/Manually-import-Stripe-transactions#3ManuallyimportStripefeestoXero

# Notes
Stripe has recently changed their back-end interface, allowing you to export
specific fields into the CSV.

To use this script, click Balance > Payouts > Export and under the Columns
drop-down menu, check the boxes for ID, Amount, Arrival Date (UTC), Total Gross
and Total Fees.

If gsub raises a nil error, check to see if the newest "Total Fees" & "Total
Gross" fields in the `payouts.csv` file are blank, which will happen if there is a
pending payout.
