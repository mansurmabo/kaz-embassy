User.create!([
                 {email: 'admin@example.com', password: 'password', password_confirmation: 'password'},
                 {email: 'manager@example.com', password: 'password', password_confirmation: 'password'}
             ])

categories = Category.create!([
                               {name: 'Республика Казахстан'},
                               {name: 'Посольство'},
                               {name: 'Консульский отдел'},
                               {name: 'Казахстанско-кыргызское сотрудрничетсво'}
                             ])
