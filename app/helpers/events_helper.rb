module EventsHelper
  def sorted_events(events)
    events.each do |event|
    end
  end

  def daily_time_range
    %w[
      0:00-4:00
      4:00-8:00
      8:00-12:00
      12:00-16:00
      16:00-20:00
      20:00-24:00
    ]
  end

  # def daily_time_range
  #   %w[
  #     0:00-2:00
  #     2:00-4:00
  #     4:00-6:00
  #     6:00-8:00
  #     8:00-10:00
  #     10:00-12:00
  #     12:00-14:00
  #     14:00-16:00
  #     16:00-18:00
  #     18:00-20:00
  #     20:00-22:00
  #     22:00-24:00
  #   ]
  # end
end
