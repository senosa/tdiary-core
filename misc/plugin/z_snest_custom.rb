def navi_prev_diary(date); "前日"; end
def navi_next_diary(date); "翌日"; end
def navi_prev_ndays; "前#{@conf.latest_limit}日"; end
def navi_next_ndays; "次#{@conf.latest_limit}日"; end
def comment_today; ''; end
def comment_total(total); "#{total}ツッコミ"; end

def navi
	result = %Q[<nav>]
	result << navi_user
	result << navi_admin
	result << %Q[</nav>]
end
