module ApplicationHelper
end

module ApplicationHelper
  def ymd(date)
    date.present? ? date.strftime('%Y/%m/%d') : ''
  end

  def ymdhm(datetime)
    datetime.present? ? datetime.strftime('%Y/%m/%d %H:%M') : ''
  end

  def maru(flag)
    flag ? '○' : ''
  end
end

module ApplicationHelper
  def ymd(date)   = date.present? ? date.strftime('%Y/%m/%d') : ''
  def ymdhm(dt)   = dt.present?   ? dt.strftime('%Y/%m/%d %H:%M') : ''
  def maru(flag)  = flag ? '○' : ''
end
