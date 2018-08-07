# Stripe Xero Conversion
A ruby script for converting stripe payment .csv statements for import into Xero.

Stripe outputs fees and transaction amounts in the CSV file as two separate
columns. Additionally, the date and time are formatted incorrectly.

The script accepts payouts.csv (available from the Balance > Payouts menu) and outputs stripe-fees.csv (containing all transaction fees) and stripe-payments.csv (containing all transaction amounts).

# Notes
The Stripe payouts.csv file records the date and the time in the same cell...we use a RegEx to clean it up

Stripe statement files used to have "$" in front of amounts. Now, instead of searching for '-$' / '$', we search for the beginnings of strings -- '\A' and replace with '-' / '' if needed.
