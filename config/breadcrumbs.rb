crumb :root do
  link "トップページ", root_path
end

crumb :mypage do
  link "マイページ", users_path
end

crumb :my_items do
  link "出品商品一覧", user_path(current_user.id)
  parent :mypage
end

crumb :seles do
  link "売上・振込申請", seles_path
  parent :mypage
end

crumb :history do
  link "売上履歴", history_seles_path
  parent :seles
end

crumb :deposit do
  link "振込申請履歴", deposit_list_seles_path
  parent :seles
end

crumb :profile do
  link "プロフィール編集", edit_user_path(current_user.id)
  parent :mypage
end

crumb :credit_card do
  link "支払い方法", edit_credit_cards_path
  parent :mypage
end

crumb :address do
  link "発送元・お届け先住所変更", edit_address_path(current_user.id)
  parent :mypage
end

crumb :seller do |user|
  link user.nickname, seller_user_path(user.id)
end

crumb :item do |item|
  link "商品詳細", item_path(item.id)
  user = User.find(item.user_id)
  parent :seller, user
end


# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).