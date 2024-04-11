module ApplicationHelper
  include Pagy::Frontend

  def date_format(date)
    date&.strftime('%d/%m/%Y')
  end
end
