module PhoneNumber
  module_function

  def clean(phone_number)
    filtered_number = (phone_number || '').gsub(/[^\d]/, '').gsub(/\A1/, '')
    filtered_number =~ /\A[2-9]\d{2}[2-9]\d{6}\z/ && filtered_number
  end
end
