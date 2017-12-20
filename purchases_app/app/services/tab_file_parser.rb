class TabFileParser
  require 'csv'

  def parse(file)
    CSV.foreach(file.path, col_sep: "\t", headers: true) do |row|
      content = row.to_hash

      # TODO
    end
  end

end
