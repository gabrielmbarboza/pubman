json.extract! citizen, :id, :full_name, :cpf, :cns, :email, :date_of_birth, :phone, :status, :created_at, :updated_at
json.url citizen_url(citizen, format: :json)
