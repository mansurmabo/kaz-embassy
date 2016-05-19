ActiveAdmin.register_page "Dashboard" do

  menu priority: 0, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span ("Articles - создание новостей")
      end
      span class: "blank_slate" do
        span ("Types - создание категории для новостей")
      end
      span class: "blank_slate" do
        span ("Pages - создание страниц контента, можно добавлять картинки ссылки и тд")
        small("Авотматически добавляется в субменю")
      end
      span class: "blank_slate" do
        span ("categries - создание категории для страниц")
        small("Авотматически добавляется в меню")
      end
      span class: "blank_slate" do
        span ("Galleries - Добавление картинок в галерею")
      end
      span class: "blank_slate" do
        span ("Slideshows - Добавление картинки в слайдшоу на фронтальной странице")
        small("Не рекомендуется добавлять более 8 штук, будут тормоза")
      end
      span class: "blank_slate" do
        span ("Third Parties - Добавление картинки в виде ссылки на сторонний ресурс")
        small("Автоматически будет попадать в контейнер под главным меню")
      end



    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
