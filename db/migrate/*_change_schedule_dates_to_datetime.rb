class ChangeScheduleDatesToDatetime < ActiveRecord::Migration[6.1]
  def up
    add_column :schedules, :start_at, :datetime
    add_column :schedules, :end_at,   :datetime

    # 旧カラムから値を移す（既に無ければこのブロックは自動でスキップされます）
    if column_exists?(:schedules, :start_date) && column_exists?(:schedules, :end_date)
      execute <<~SQL
        UPDATE schedules
        SET start_at = datetime(start_date || ' 00:00:00'),
            end_at   = datetime(end_date   || ' 00:00:00')
      SQL
      remove_column :schedules, :start_date
      remove_column :schedules, :end_date
    end
  end

  def down
    add_column :schedules, :start_date, :date
    add_column :schedules, :end_date,   :date
    execute <<~SQL
      UPDATE schedules
      SET start_date = date(start_at),
          end_date   = date(end_at)
    SQL
    remove_column :schedules, :start_at
    remove_column :schedules, :end_at
  end
end
