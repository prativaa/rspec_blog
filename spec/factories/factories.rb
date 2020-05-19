FactoryBot.define do
  factory :post do
    title {"Post Title"}
    author  {"Momo Taro"}
    content {"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam"}

    factory :invalid_post do
      content { "Short content" }
    end
  end
end