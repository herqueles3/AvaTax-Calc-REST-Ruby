require_relative 'AvaTaxClasses/TaxSvc'

# Header Level Elements
# Required Header Level Elements
accountNumber = "1234567890"
licenseKey = "A1B2C3D4E5F6G7H8"
serviceURL = "https://development.avalara.net"

taxSvc = TaxSvc.new(accountNumber, licenseKey, serviceURL);

cancelTaxRequest = {
    # Required Request Parameters
    :CompanyCode => "APITrialCompany",
    :DocType => "SalesInvoice",
    :DocCode => "INV001",
    :CancelCode => "DocVoided"
    }

cancelTaxResult = taxSvc.CancelTax(cancelTaxRequest)

# Print Results
puts "CancelTaxTest ResultCode: "+cancelTaxResult["ResultCode"]
if cancelTaxResult["ResultCode"] != "Success"
  cancelTaxResult["Messages"].each { |message| puts message["Summary"] }
end