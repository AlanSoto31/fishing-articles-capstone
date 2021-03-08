module CategoriesHelper
  def first_article_by_category(c_id)
    @first_article = if Categorize.where(category_id: c_id).present? == false
                       'n/a'
                     else
                       Fishing.includes(:categories).where(categories: { id: c_id }).order(created_at: :desc).first
                     end
  end

  def check_img_exist(art)
    @img = if art.image.present?
             art.image
           elsif art.imagen.present?
             art.imagen
           else
             'default_img.jpg'
           end
  end

  def edit_article(article)
    return unless user_sign_in? && (current_user.id == article.author_id)

    link_to 'Edit', edit_fishing_path(article), class: 'text-decoration-none fw-bold'
  end

  def delete_article(article)
    return unless user_sign_in? && (current_user.id == article.author_id)

    link_to 'Delete', fishing_path(article), method: :delete, class: 'text-decoration-none fw-bold'
  end
end
