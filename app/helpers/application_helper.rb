module ApplicationHelper
	def fix_url(str)
		str.starts_with?("http://") ? str : "http://#{str}"
	end

	def date_long(str)
		dateTimeNow = DateTime.now
		dateTimeThen = str
		dateNow = Date.today
		dateThen = dateTimeThen.to_date
		diffDates = (dateThen - dateNow).to_i
		timeThen = dateTimeThen.to_time
		diffTimes = (timeThen - Time.now).to_i
		if(dateThen < 7.days.ago)
			return "on " + dateThen.to_formatted_s(:long)
		else
				return distance_of_time_in_words_to_now(timeThen) + " ago"
		end
	end
end
