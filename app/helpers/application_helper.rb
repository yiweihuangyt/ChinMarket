module ApplicationHelper
  include Pagy::Frontend


  def language_dropdown
    content_tag(:div, class: "language-dropdown") do
      concat(link_to(I18n.t("navbar.#{I18n.locale}"), "#", class: "dropdown-toggle"))
      concat(content_tag(:ul, class: "dropdown-menu") do
        I18n.available_locales.each do |locale|
          concat(content_tag(:li, class: ("active" if locale == I18n.locale)) do
            link_to(I18n.t("navbar.#{locale}"), url_for(locale: locale))
          end)
        end
      end)
    end
  end

end
