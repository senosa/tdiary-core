# integrated_navi.rb プラグイン
#
# 通常のnaviに、カレンダーとRSS feedのアイコンを追加。
# dropdown_calendar.rbを有効にしておくこと。
# @options['dropdown_calendar.label']は空('')にしておく。
def navi
	result = %Q[<div class="adminmenu">\n]
	result << navi_user
	result << navi_admin
	result << %Q[<span class="adminmenu">]
	result << calendar
	result << %Q[</span>]
	result << %Q[<span class="adminmenu">]
	result << %Q[<form action="http://www.google.com/cse" id="cse-search-box">
	<div>
		<input type="hidden" name="cx" value="004719649733982785495:9f0gwfcexni" />
		<input type="hidden" name="ie" value="UTF-8" />
		<input id="qbox" type="text" name="q" size="26" />
		<input type="submit" name="sa" value="Go" />
	</div>
</form>
<script type="text/javascript" src="http://www.google.com/coop/cse/brand?form=cse-search-box&lang=ja"></script>
]
	result << %Q[</span>]
	result << %Q[<span class="adminmenu"><a href="index.rdf"><img style="border-width: 0px;" src="./feed-icon-16x16.png" width="16" height="16" alt="RSS feed"></a></span>]
	result << %Q[</div>]
end
