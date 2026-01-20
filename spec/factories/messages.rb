FactoryBot.define do
  factory :message do
    content { Faker::Lorem.sentence }
    association :user
    association :room

    after(:create) do |message|
      image_path = Rails.root.join("spec/fixtures/files/部屋.jpg")

      raise "画像が存在しません: #{image_path}" unless File.exist?(image_path)

      message.image.attach(
        io: File.open(image_path),
        filename: "部屋.jpg",
        content_type: "image/jpeg"
      )
    end
  end
end
