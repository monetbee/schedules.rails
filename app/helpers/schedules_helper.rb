module SchedulesHelper
  def ymd(dt)
    dt&.in_time_zone&.strftime('%Y-%m-%d')
  end

  def ymdhm(dt)
    dt&.in_time_zone&.strftime('%Y-%m-%d %H:%M')
  end

  # 終日なら日付だけ、そうでなければ日時
  def date_by_all_day(dt, all_day)
    all_day ? ymd(dt) : ymdhm(dt)
  end

  def maru(v)
    v ? '◯' : '—'
  end
end
