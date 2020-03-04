class ItemsController < ApplicationController
  before_action :authenticate_user!, expect: [:show]
  before_action :set_item, only: [:show ,:destroy, :edit, :update]

  def show
    @item_image = @item.item_images[0].url.url
    @category_flag = category_flag(@item.category)
    @next_id, @prev_id = set_page(@item)
  end

  def new
    @item = Item.new
    @item.item_images.new
    @parent_categories = Category.where(ancestry: nil)

    respond_to do |format|
      format.html
      format.json {@child_categories = Category.find(params[:category_id]).children}
    end
  end


  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      @item.item_images.new
      render :new
    end
  end

  def destroy
    if current_user.id == @item.user_id && @item.destroy
      render template: "items/destroy"
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
    @grandchild_category = Category.find(@item[:category_id])
    @child_category = @grandchild_category.parent
    @parent_category = @child_category.parent
    @grandchild_categories = @child_category.children
    @child_categories = @parent_category.children
    @parent_categories = Category.where(ancestry: nil)
  end

  def update
    if current_user.id == @item.user_id && @item.update(item_params)
      redirect_to item_path(params[:id])
    else
      render :edit
    end
  end

  private
  
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :price, :condition_id , :brand_id, :shipping_fee_who_id, :prefecture_id, :shipping_days_id, item_images_attributes: [:url, :_destroy, :id] ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_page(item)
    next_id = Item.find_by("user_id = ? and id > ?", item.user_id, item.id)
    prev_id = Item.where("user_id = ? and id < ?", item.user_id, item.id).last
    next_id = item.id if next_id.blank?
    prev_id = item.id if prev_id.blank?
    return next_id, prev_id
  end

  def category_flag(category)
    if category.ancestry.nil?
      return 1
    elsif category.parent.parent.nil?
      return 2
    else
      return 3
    end
  end
end
