ActiveAdmin.register_page "Dashboard" do

  menu priority: 0, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span ("Cоздание новостей")
        small ("Статьи с изображениями будут автоматически попадать в слайдшоу")
      end
      span class: "blank_slate" do
        span ("Категории для новостей")
        small("Вы не сможете удалить категорию если в ней есть хотя бы одна статья")
      end
      span class: "blank_slate" do
        span ("Cоздание страниц контента, можно добавлять картинки ссылки и тд")
        small("Автоматически добавляется в подменю")
      end
      span class: "blank_slate" do
        span ("Создание категории для страниц")
        small("Автоматически добавляется в меню")
      end
      span class: "blank_slate" do
        span ("Галерея")
        small ("Изображения без категорий не будут отображаться")
      end
      span class: "blank_slate" do
        span ("Сторонние ресурсы - Добавление картинки в виде ссылки на сторонний ресурс")
        small("Автоматически будет попадать в контейнер под главным меню")
        end
      span class: "blank_slate" do
        span ("События будут отображаться в календаре")
        small("События с изображениями буду отображаться в контейнере слева, до тех пор, пока событие акутально")
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
