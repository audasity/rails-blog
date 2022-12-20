module ApplicationHelper
    def format_time(timestamp)
        timestamp.strftime("%d/%m/%Y %H:%M")
    end
end
