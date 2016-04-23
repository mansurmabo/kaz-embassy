users = User.create!([
                 {email: 'admin@example.com', password: 'password', password_confirmation: 'password', role: 'admin'},
                 {email: 'manager@example.com', password: 'password', password_confirmation: 'password', role: 'moder'}
             ])

categories = Category.create!([
                               {id: 1, name: 'Республика Казахстан'},
                               {id: 2, name: 'Посольство'},
                               {id: 3, name: 'Консульский отдел'},
                               {id: 4, name: 'Казахстанско-кыргызское сотрудрничетсво'},
                             ])
subCategories = Page.create!([
                                 {title: 'Информация о Казахстане', category_id: 1},
                                 {title: 'Конституция', category_id: 1},
                                 {title: 'Государственные символы', category_id: 1},
                                 {title: 'Президент', category_id: 1},
                                 {title: 'Парламент', category_id: 1},
                                 {title: 'Правительство', category_id: 1},
                                 {title: 'О главе Посольства', category_id: 2},
                                 {title: 'Дипломатический состав', category_id: 2},
                                 {title: 'Месторасположение Посольства', category_id: 2},
                                 {title: 'Консульско-правовые вопросы', category_id: 3},
                                 {title: 'Паспортно-визовые вопросы', category_id: 3},
                                 {title: 'Стандарты и регламенты гос услуг', category_id: 3},
                                 {title: 'Информация о Почетных консулах РК', category_id: 3},
                                 {title: 'Почетное консульство РК в Таласской области', category_id: 3},
                                 {title: 'Общая информация', category_id: 4},
                                 {title: 'События', category_id: 4}
                             ]

)

