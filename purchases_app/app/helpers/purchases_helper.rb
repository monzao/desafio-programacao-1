module PurchasesHelper
  def purchases_total(purchases)
    total = 0
    purchases.each { |purchase| total += purchase.item.price * purchase.count }
    number_to_currency(total, unit: "R$", separator: ",", delimiter: "")
  end
end
