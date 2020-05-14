FactoryBot.define do
  factory :post do
    title {"Post Title"}
    author  {"Momo Taro"}
    content {"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam"}
  end

  # factory :invalid_post do
  #   title {""}
  #   author {""}
  #   content {"Short content"}
  # end
end