json.extract! profile, :id, :gender, :birth_year, :first_name, :last_name, :belongs_to, :User, :created_at, :updated_at
json.url profile_url(profile, format: :json)