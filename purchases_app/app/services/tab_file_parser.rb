class TabFileParser
  require 'csv'

  def parse(file)
    read_file(file)
  end

  def parse_purchaser(name)
    Purchaser.find_or_create_by(name: name)
  end

  def parse_merchant(name, address)
    Merchant.find_or_create_by(name: name) do |m|
      m.address = address
    end
  end

  def parse_item(description, price, merchant)
    Item.create(description: description, price: price.to_f, merchant: merchant)
  end

  def parse_purchase(purchaser, item, count)
    Purchase.create(purchaser: purchaser, item: item, count: count.to_i)
  end

  def read_file(file)
    purchases = []

    CSV.foreach(file.path, col_sep: "\t", headers: true, header_converters: :symbol) do |row|
      content = row.to_hash

      purchaser = parse_purchaser(content[:purchaser_name])

      merchant = parse_merchant(content[:merchant_name], content[:merchant_address])

      item = parse_item(content[:item_description], content[:item_price], merchant)

      purchase = parse_purchase(purchaser, item, content[:purchase_count])

      purchases << purchase
    end

    purchases
  end
end
