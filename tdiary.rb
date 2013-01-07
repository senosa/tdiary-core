# -*- coding: utf-8; -*-
=begin
== NAME
tDiary: the "tsukkomi-able" web diary system.

Copyright (C) 2001-2012, TADA Tadashi <t@tdtds.jp>
You can redistribute it and/or modify it under GPL2.
=end

TDIARY_VERSION = '3.2.0.20130107'

$:.unshift File.join(File::dirname(__FILE__), '/misc/lib').untaint
Dir["#{File::dirname(__FILE__) + '/vendor/*/lib'}"].each {|dir| $:.unshift dir.untaint }

require 'cgi'
require 'uri'
require 'logger'
require 'fileutils'
require 'pstore'
require 'json'
require 'erb'
require 'tdiary/compatible'
require 'tdiary/core_ext'

#
# module TDiary
#
module TDiary
	PATH = File::dirname( __FILE__ ).untaint

	autoload :Config,                   'tdiary/config'
	autoload :Plugin,                   'tdiary/plugin'

	autoload :DiaryBase,                'tdiary/style'
	autoload :SectionBase,              'tdiary/style'
	autoload :CategorizableDiary,       'tdiary/style'
	autoload :UncategorizableDiary,     'tdiary/style'
	autoload :Comment,                  'tdiary/comment'
	autoload :Filter,                   'tdiary/filter'
	autoload :CommentManager,           'tdiary/comment_manager'
	autoload :RefererManager,           'tdiary/referer_manager'

	autoload :Dispatcher,               'tdiary/dispatcher'
	autoload :Request,                  'tdiary/request'
	autoload :Response,                 'tdiary/response'

	autoload :TDiaryBase,               'tdiary/base'
	autoload :TDiaryCategoryView,       'tdiary/base'
	autoload :TDiarySearch,             'tdiary/base'
	autoload :TDiaryAuthorOnlyBase,     'tdiary/author_only_base'
	autoload :TDiaryFormPlugin,         'tdiary/author_only_base'
	autoload :TDiaryConf,               'tdiary/author_only_base'
	autoload :TDiarySaveConf,           'tdiary/author_only_base'
	autoload :TDiaryAdmin,              'tdiary/admin'
	autoload :TDiaryForm,               'tdiary/admin'
	autoload :TDiaryEdit,               'tdiary/admin'
	autoload :TDiaryPreview,            'tdiary/admin'
	autoload :TDiaryUpdate,             'tdiary/admin'
	autoload :TDiaryAppend,             'tdiary/admin'
	autoload :TDiaryReplace,            'tdiary/admin'
	autoload :TDiaryShowComment,        'tdiary/admin'
	autoload :TDiaryView,               'tdiary/view'
	autoload :TDiaryDay,                'tdiary/view'
	autoload :TDiaryComment,            'tdiary/view'
	autoload :TDiaryMonthBase,          'tdiary/view'
	autoload :TDiaryMonth,              'tdiary/view'
	autoload :TDiaryNYear,              'tdiary/view'
	autoload :TDiaryMonthWithoutFilter, 'tdiary/view'
	autoload :TDiaryLatest,             'tdiary/view'

	#
	# exception classes
	#
	class TDiaryError < StandardError; end
	class PermissionError < TDiaryError; end
	class PluginError < TDiaryError; end
	class BadStyleError < TDiaryError; end
	class NotFound < TDiaryError;	end

	# class ForceRedirect
	#  force redirect to another page
	#
	class ForceRedirect < StandardError
		attr_reader :path
		def initialize( path )
			@path = path
		end
	end
end

# Local Variables:
# mode: ruby
# indent-tabs-mode: t
# tab-width: 3
# ruby-indent-level: 3
# End:
# vim: ts=3
