module CategoriesHelper
  def first_article_by_category(c_id)
    if Categorize.where(category_id: c_id).present? == false
      @first_article = 'n/a'
    else
      @first_article = Fishing.includes(:categories).where(categories: { id: c_id }).order(created_at: :desc).first
    end
  end

  def check_img_exist(a)
    if a.image.present?
      @img = a.image
    else
      @img = "default_img.jpg"
    end
  end

  def check_owner(article)
    if user_sign_in?
      if current_user.id == article.author_id
        @edit_button = link_to "Edit", edit_fishing_path(article), class: 'text-decoration-none fw-bold' 
        @delete_button = link_to "Delete", fishing_path(article), method: :delete, class: 'text-decoration-none fw-bold'
      end
    end
  end
end
