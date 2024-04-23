# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

TEST_GMAIL_ACCOUNT_NAME = ENV["TEST_GMAIL_ACCOUNT_NAME"]
TEST_PASSWORD = ENV["TEST_PASSWORD"]

Admin.create!(
   email: 'admin@gmail',
   password: '123456'
)

initial_genres = [
  {name: "ダイエット"},
  {name: "誰でも歓迎"},
  {name: "30代トレーニー"},
  {name: "40代トレーニー"},
  {name: "女性トレーニー"}
]
Genre.create!(initial_genres)

initial_users = [
  {
    "name": "田中太郎",
    "introduction": "こんにちは、田中太郎です。最近は筋トレにハマっています！特にスクワットとデッドリフトがお気に入りです。一緒にトレーニングの楽しさを共有しましょう！",
    "active": true
  },
  {
    "name": "佐藤真美",
    "introduction": "こんにちは、佐藤真美です。筋トレが日課です！プッシュアップやプランクなどの体幹トレーニングが得意です。一緒に頑張りましょう！",
    "active": true
  },
  {
    "name": "鈴木健太",
    "introduction": "こんにちは、鈴木健太です。筋トレ愛好家です！ベンチプレスやチンニングなどのトレーニングが日課です。一緒に成長しましょう！",
    "active": true
  },
  {
    "name": "伊藤悟",
    "introduction": "こんにちは、伊藤悟です。筋トレを趣味としており、特にデッドリフトやショルダープレスが得意です。一緒にトレーニングを楽しみましょう！",
    "active": true
  },
  {
    "name": "渡辺優",
    "introduction": "こんにちは、渡辺優です。筋トレが生活の一部となっています！筋力トレーニングや有酸素運動をバランスよく行っています。一緒に健康な体を目指しましょう！",
    "active": true
  }
]
initial_users.each.with_index(1) do |user, i|
  user["email"] = "#{TEST_GMAIL_ACCOUNT_NAME}#{i}@gmail"
  user["password"] = TEST_PASSWORD
  user["password_confirmation"] = TEST_PASSWORD
  new_user = User.create!(user)
  profile_image_path = Rails.root.join("app/assets/images/seeds/user_#{sprintf("%02d",i)}.jpg")
  new_user.profile_image.attach(io: File.open(profile_image_path), filename: "user_#{sprintf("%02d",i)}.jpg")
end

initial_groups = [
  {
    "genre_id": 1,
    "title": "筋トレ初心者の集い！",
    "body": "筋トレ初心者が集まるグループです。一緒にトレーニングの基礎から学んでいきましょう！",
    "owner_id": 3
  },
  {
    "genre_id": 2,
    "title": "ダンベルトレーニングマスター",
    "body": "ダンベルトレーニングが得意な人や情報を求めている人のためのグループです。効果的なダンベルエクササイズを共有しましょう！",
    "owner_id": 4
  },
  {
    "genre_id": 3,
    "title": "ランニングクラブ",
    "body": "ランニングが好きな人や、一緒に走る仲間を募集するグループです。走ることの楽しさを共有しましょう！",
    "owner_id": 5
  },
  {
    "genre_id": 2,
    "title": "ベンチプレスが好きな人集まれ！",
    "body": "ベンチプレスが好きで、挙上重量を上げたい人。ベンチプレスについて質問をしたい人が情報交換するためのグループです。",
    "owner_id": 2
  },
  {
    "genre_id": 5,
    "title": "ダイエット研究会",
    "body": "ダイエットをしたい人や、助言や情報を求めている人が集まるグループです。一緒にダイエット頑張りましょう！",
    "owner_id": 4
  },
  {
    "genre_id": 1,
    "title": "筋肉部隊",
    "body": "筋肉をつけたい人や、筋トレに関する情報を共有したい人が集まるグループです。モチベーションを高め合いましょう！",
    "owner_id": 3
  }
]
initial_groups.each.with_index(1) do |group, i|
  new_group = Group.create!(group)
  image_path = Rails.root.join("app/assets/images/seeds/group_#{sprintf("%02d",i)}.jpg")
  new_group.group_image.attach(io: File.open(image_path), filename: "group_#{sprintf("%02d",i)}.jpg")
end

initial_members = [
  { user_id: 1, group_id: 1 },
  { user_id: 2, group_id: 1 },
  { user_id: 3, group_id: 2 },
  { user_id: 4, group_id: 2 },
  { user_id: 5, group_id: 3 },
  { user_id: 1, group_id: 3 },
  { user_id: 2, group_id: 3 },
  { user_id: 3, group_id: 4 },
  { user_id: 4, group_id: 4 },
  { user_id: 5, group_id: 5 },
  { user_id: 1, group_id: 5 },
  { user_id: 2, group_id: 5 },
  { user_id: 3, group_id: 6 },
  { user_id: 4, group_id: 6 },
]
initial_members.each do |member|
  Member.create!(member)
end