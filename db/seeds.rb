# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# 管理者作成
Admin.create!(
   email: 'admin@gmail',
   password: '123456'
)



# ジャンル作成
initial_genres = [
  {name: "誰でも歓迎"},
  {name: "ダイエット"},
  {name: "バルクアップ"},
  {name: "フリーウエイト"},
  {name: "有酸素"},
  {name: "シニアトレーニー"},
  {name: "女性トレーニー"},
  {name: "その他"}
]
Genre.create!(initial_genres)

# ユーザー作成
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
  },
  {
    "name": "山田花子",
    "introduction": "こんにちは、山田花子です。最近はヨガにハマっています！特にヴィンヤサやヨガのポーズがお気に入りです。一緒に心と体をリフレッシュしましょう！",
    "active": true
  },
  {
    "name": "中村和樹",
    "introduction": "こんにちは、中村和樹です。ウェイトトレーニングが大好きです！スクワットやデッドリフトなどの筋力トレーニングが得意です。一緒にトレーニングを楽しみましょう！",
    "active": true
  },
  {
    "name": "林太一",
    "introduction": "こんにちは、林太一です。ランニングが好きで、週末はよく公園でジョギングを楽しんでいます。一緒に走る仲間を募集しています！",
    "active": true
  },
  {
    "name": "高橋美咲",
    "introduction": "こんにちは、高橋美咲です。ジョギングが趣味です！朝の爽やかな風を感じながらランニングするのが最高です。一緒に健康的な生活を送りましょう！",
    "active": true
  },
  {
    "name": "岡田光男",
    "introduction": "こんにちは、岡田光男です。筋トレが趣味で、ジムでトレーニングを楽しんでいます！特にベンチプレスやデッドリフトが好きです。一緒に鍛え合いましょう！",
    "active": true
  },
  {
    "name": "佐々木大輔",
    "introduction": "こんにちは、佐々木大輔です。筋トレが大好きで、ジムでのトレーニングを日々楽しんでいます！特にベンチプレスやデッドリフトが得意です。一緒にトレーニングを楽しみましょう！",
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

# グループ作成
initial_groups = [
  {
    "genre_id": 1,
    "title": "筋トレ初心者の集い！",
    "body": "筋トレ初心者が集まるグループです。一緒にトレーニングの基礎から学んでいきましょう！",
    "owner_id": 3
  },
  {
    "genre_id": 4,
    "title": "ダンベルトレーニングマスター",
    "body": "ダンベルトレーニングが得意な人や情報を求めている人のためのグループです。効果的なダンベルエクササイズを共有しましょう！",
    "owner_id": 4
  },
  {
    "genre_id": 5,
    "title": "ランニングクラブ",
    "body": "ランニングが好きな人や、一緒に走る仲間を募集するグループです。走ることの楽しさを共有しましょう！",
    "owner_id": 5
  },
  {
    "genre_id": 4,
    "title": "ベンチプレスが好きな人集まれ！",
    "body": "ベンチプレスが好きで、挙上重量を上げたい人。ベンチプレスについて質問をしたい人が情報交換するためのグループです。",
    "owner_id": 2
  },
  {
    "genre_id": 2,
    "title": "ダイエット研究会",
    "body": "ダイエットをしたい人や、助言や情報を求めている人が集まるグループです。一緒にダイエット頑張りましょう！",
    "owner_id": 1
  },
  {
    "genre_id": 3,
    "title": "筋肉部隊",
    "body": "筋肉をつけたい人や、筋トレに関する情報を共有したい人が集まるグループです。モチベーションを高め合いましょう！",
    "owner_id": 6
  },
  {
  "genre_id": 7,
  "title": "ヨガの楽しみ",
  "body": "ヨガを楽しんでいる人や、ヨガに関する情報を共有したい人が集まるグループです。心と体をリフレッシュしましょう！",
  "owner_id": 7
  },
  {
  "genre_id": 4,
  "title": "BIG3を極めし者達",
  "body": "BIG3に興味のある人や、BIG3に関する情報を共有したい人が集まるグループです。力を合わせて成長しましょう！",
  "owner_id": 8
  },
  {
  "genre_id": 8,
  "title": "フィットネス学習サークル",
  "body": "フィットネスに興味のある人や、フィットネスに関する知識を深めたい人が集まるサークルです。トレーニング方法や栄養学など、様々なテーマを学んでいきましょう！",
  "owner_id": 9
  },
  {
  "genre_id": 8,
  "title": "雑談の部屋",
  "body": "気軽に雑談したり、趣味について語ったりするためのグループです。日常の出来事や興味深い話題など、何でも話し合いましょう！",
  "owner_id": 10
  }
]
initial_groups.each.with_index(1) do |group, i|
  new_group = Group.create!(group)
  image_path = Rails.root.join("app/assets/images/seeds/group_#{sprintf("%02d",i)}.jpg")
  new_group.group_image.attach(io: File.open(image_path), filename: "group_#{sprintf("%02d",i)}.jpg")
end


# グループメンバー追加
initial_members = []

user_ids = (1..11).to_a.shuffle
group_ids = (1..10).to_a

group_ids.each do |group_id|
  owner = User.find(Group.find(group_id).owner_id)
  members = [owner.id]
  3.times do
    user_id = user_ids.shift
    members << user_id
  end
  members.each do |user_id|
    initial_members << { user_id: user_id, group_id: group_id }
  end
end

initial_members.each do |member|
  Member.create(member)
end


# スレッド作成
first_group = Group.first

11.times do |i|
  PostThread.create!(
    user_id: first_group.owner_id, 
    group_id: first_group.id,
    title: "BIG3研究#{i + 1}",
    body: "語りましょう#{i + 1}"
  )
end


# 部位の作成
parts = [
  "胸",
  "脚",
  "背中",
  "肩",
  "腕",
  "腹筋"
]
(1..11).each do |user_id|
  parts.each do |part_name|
    Part.create!(
      user_id: user_id,
      name: part_name
    )
  end
end

# エクササイズの作成
exercises = [
  "ベンチプレス",
  "インクラインベンチプレス",
  "スクワット",
  "デッドリフト",
  "懸垂",
  "ベントオーバーロウ",
  "バーベルカール",
  "フレンチプレス",
  "OHP",
  "サイドレイズ"
]

(1..11).each do |user_id|
  exercises.each do |exercise_name|
    Exercise.create!(
      user_id: user_id,
      name: exercise_name
    )
  end
end

# レコードの作成
Record.create!(
  user_id: 1,
  part_id: 1,
  exercise_id: 1,
  name: "胸 - ベンチプレス",
  weight: 100,
  rep: 10,
  set: 1,
  memo: "良いトレーニングでした。",
  created_at: "2024-04-01T12:00:00Z",
  updated_at: "2024-04-01T12:00:00Z"
)

Record.create!(
  user_id: 1,
  part_id: 2,
  exercise_id: 3,
  name: "脚 - スクワット",
  weight: 130,
  rep: 5,
  set: 1,
  memo: "ちょっと重かった。",
  created_at: "2024-04-02T12:00:00Z",
  updated_at: "2024-04-02T12:00:00Z"
)

Record.create!(
  user_id: 1,
  part_id: 2,
  exercise_id: 4,
  name: "脚 - デッドリフト",
  weight: 170,
  rep: 3,
  set: 1,
  memo: "",
  created_at: "2024-04-03T12:00:00Z",
  updated_at: "2024-04-03T12:00:00Z"
)