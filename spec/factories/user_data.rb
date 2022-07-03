FactoryBot.define do
  factory :user_datum do
    name { "Iqbal Fakhriza" }
    user_id {2}
    location { "Indonesia" }
    contact { "082168321782" }
    birth_date { "03/12/2001" }
    nationality { "Indonesia" }
  end

  factory :invalid_user_datum, parent: :user_datum do
    name { nil }
    user_id {2}
    location { "Indonesia" }
    contact { "082168321782" }
    birth_date { "03/12/2001" }
    nationality { "Indonesia" }
  end
end
