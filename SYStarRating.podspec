#
#  Be sure to run `pod spec lint SYStarRating.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#
s.name         = 'SYStarRating'
s.version      = '0.0.1'
s.summary      = 'SYStarRating is an star rating control.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!
s.description  =  'SYStarRatingView is an star rating control'

s.homepage     = 'https://github.com/zhangsuya/SYStarRatingView'
# s.screenshots  = 'www.example.com/screenshots_1.gif', 'www.example.com/screenshots_2.gif'


# ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
#
#  Licensing your code is important. See http://choosealicense.com for more info.
#  CocoaPods will detect a license file if there is a named LICENSE*
#  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
#

s.license      = 'MIT'
# s.license      = { :type => 'MIT', :file => 'FILE_LICENSE' }


# ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
#
#  Specify the authors of the library, with email addresses. Email addresses
#  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also
#  accepts just a name if you'd rather not provide an email address.
#
#  Specify a social_media_url where others can refer to, for example a twitter
#  profile URL.
#

s.author             = { '苏亚' => '792708835@qq.com' }
# Or just: s.author    = '苏亚'
# s.authors            = { '苏亚' => '792708835@qq.com' }
# s.social_media_url   = 'http://twitter.com/苏亚'

# ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
#
#  If this Pod runs only on iOS or OS X, then specify the platform and
#  the deployment target. You can optionally include the target after the platform.
#

# s.platform     = :ios
s.platform     = :ios, '8.0'

#  When using multiple platforms
s.ios.deployment_target = '8.0'
# s.osx.deployment_target = '10.7'
# s.watchos.deployment_target = '2.0'
# s.tvos.deployment_target = '9.0'


# ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
#
#  Specify the location from where the source should be retrieved.
#  Supports git, hg, bzr, svn and HTTP.
#

s.source       = { :git => 'https://github.com/zhangsuya/SYStarRatingView.git', :tag => s.version }


# ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
#
#  CocoaPods is smart about how it includes source code. For source files
#  giving a folder will include any swift, h, m, mm, c & cpp files.
#  For header files it will include any header in the folder.
#  Not including the public_header_files will make all headers public.
#

s.source_files  =  'SYStarRatingView/SYStarRating/**/*.{h,m}'
# s.exclude_files = 'SYStarRatingView/SYStarRating/Exclude'

s.public_header_files = 'SYStarRatingView/SYStarRating/**/*.h'
s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
