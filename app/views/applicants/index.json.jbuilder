json.array!(@applicants) do |applicant|
  json.extract! applicant, :id, :name, :phone_number, :email, :market
  json.url applicant_url(applicant, format: :json)
end
