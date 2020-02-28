require 'csv'

CSV.generate do |csv|
  csv_column_names = %w(商品名 大分類 中分類 小分類 ブランド 販売価格 販売利益 振込申請 売上日時)
  csv << csv_column_names
  @seles.each do |sele|
    csv_column_values = [
      sele.name,
      sele.category,
      sele.subcategory,
      sele.subsubcategory,
      sele.brand,
      sele.revenue,
      sele.profit,
      sele.deposit == true ? "申請済" : "未申請",
      sele.created_at,
    ]
    csv << csv_column_values
  end
end