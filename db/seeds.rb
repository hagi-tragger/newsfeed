# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

puts 'SETTING UP EXAMPLE USERS'
user1 = User.create(
  :email => 'dave@dave.com',
  :name => 'dave',
  :password => 'secret',
  :password_confirmation => 'secret'
)
user2 = User.create(
  :email => 'alice@alice.net',
  :name => 'alice',
  :password => '123456',
  :password_confirmation => '123456'
)
user3 = User.create(
  :email => 'bill@bill.org',
  :name => 'bill',
  :password => 'qwerty',
  :password_confirmation => 'qwerty'
)
puts 'SETTING UP EXAMPLE TAGS'
Tag.create(
  [ { :name => 'google'		},
    { :name => 'service'	},
    { :name => 'music'		},
    { :name => 'processor'	},
    { :name => 'poster'		},
    { :name => 'navalny'	},
    { :name => 'bloggers'	},
    { :name => 'censure'	},
    { :name => 'yandex'		}
  ]
)
puts 'SETTING UP EXAMPLE POSTS'
post1 = Post.new(
  :category => 'crime',
  :theme => 'Блогеры уличили «Яндекс» в цензуре. Поисковик не находит плакаты с конкурса Навального',
  :content =>
  %{
  	Российские блогеры уличили «Яндекс» в цензуре и требуют официальных комментариев от руководства интернет-сервиса. Подозрения ЖЖ-пользователей вызвали совершенно разные результаты, которые Google и Yandex выдают на запросы «пора меняться» и «партия жуликов и воров плакат». Речь идет об акции оппозиции, вывесившей неподалеку от Кремля транспарант с изображением Владимира Путина за решеткой и Михаила Ходорковского, а также о конкурсе плакатов, организованном Алексеем Навальным. Yandex не пропускает подобные картинки. «А теперь внимание: найдите разницу в выдаче картинок по запросу «пора меняться» в Гугле и в Яндексе. Я пролистал 10 страниц – пусто. Может чего Яндекс не знает, того и не было? – интересуется ibigdan. – Или запрос «партия жуликов и воров плакат», сначала в Гугле, а потом в Яндексе. Красота, да? И контрольный в голову, «навальный»: в Гугле и в Яндексе. Тон новостей как-то отличается». При этом на mail.ru, отмечают блогеры, цензуры нет, а на rambler.ru есть. ЖЖисты напоминают о том, как в Китае Google «под угрозой запрета был вынужден ввести цензуру, и по запросу «площадь Тяньаньмэнь» выдавал радостные коммунистические отчёты и картинки процветания». «Ау, Яндекс? Я знаю, вы прочитаете этот пост. Мы здесь в ЖЖшечке очень ждём ваши официальные комментарии, – пишет блогер. – А то без них какие-то нехорошие мысли в голову лезут (и могут там остаться)»
  },
  :source => 'http://www.nr2.ru/moskow/325656.html'
)
post1.tags << Tag.find_by_name('poster')
post1.tags << Tag.find_by_name('navalny')
post1.tags << Tag.find_by_name('bloggers')
post1.tags << Tag.find_by_name('censure')
post1.tags << Tag.find_by_name('yandex')
post2 = Post.new(
  :category => 'tech',
  :theme => 'Европейцы построили первый пластиковый процессор',
  :content => 
  %{
  	Экспериментальный процессор состоит из полимеров, скромной толики металла и органических веществ. Он сильно уступает кремниевым собратьям в производительности, зато лёгок, гибок и дёшев.
  },
  :source => 'http://www.membrana.ru/particle/15912'
)
post2.tags << Tag.find_by_name('processor')
post3 = Post.new(
  :category => 'common',
  :theme => 'Google намерена запустить музыкальный сервис в течение одного-двух месяцев',
  :content =>
  %{
  	Работники Google говорят, что пока им доступна служебная версия Google Music, а конечный продукт сервиса может отличаться от представленной сейчас внутренней версии продукта. Согласно неофициальным данным, при помощи Google Music пользователи могут в потоковом режиме (то есть без скачивания) слушать музыкальные записи на своих интернет-подключенных устройствах.
  },
  :source => 'http://www.cybersecurity.ru/news/118640.html'
)
post3.tags << Tag.find_by_name('google')
post3.tags << Tag.find_by_name('service')
post3.tags << Tag.find_by_name('music')
    
user2.posts << post1
user2.save!
user3.posts << post2
user3.posts << post3
user3.save!
 
puts 'SETTING UP MORE USERS'
user4 = User.create(
  :email => 'john@cash.com',
  :name => 'johnny',
  :password => 'asdfgh',
  :password_confirmation => 'asdfgh'
)
user5 = User.create(
  :email => 'june@carter.com',
  :name => 'june',
  :password => 'zxcvbn',
  :password_confirmation => 'zxcvbn'
)
puts 'SETTING UP EXAMPLE COMMENTS'    
comment1 = Comment.create(
  :post_id => post2.id,
  :user_id => user4.id,
  :body => 'cool!'
)
comment2 = Comment.create(
  :post_id => post2.id,
  :user_id => user5.id,
  :body => 'nice!'
)
comment3 = Comment.create(
  :post_id => post3.id,
  :user_id => user1.id,
  :body => 'awesome'
)
comment4 = Comment.create(
  :post_id => post3.id,
  :user_id => user2.id,
  :body => 'amazing'
)
comment5 = Comment.create(
  :post_id => post3.id,
  :user_id => user4.id,
  :body => 'wonderful'
)
puts 'SETTING UP EXAMPLE VOTES'    
vote1 = Vote.create(
  :post_id => post1.id,
  :user_id => user1.id,
  :value => 1
)
vote2 = Vote.create(
  :post_id => post2.id,
  :user_id => user2.id,
  :value => -1
)
