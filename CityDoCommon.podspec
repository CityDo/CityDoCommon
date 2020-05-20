Pod::Spec.new do |s|
    s.name         = 'CityDoCommon'
    s.version      = '0.0.1'
    s.summary      = 'a common component'
    s.homepage     = 'https://github.com/CityDo/CityDoCommon'
    s.license      = 'MIT'
    s.authors      = { 'volientDuan' => 'volientduan@163.com' }
    s.platform     = :ios, '9.0'
    s.framework = "UIKit"
    s.source       = { :git => 'https://github.com/CityDo/CityDoCommon.git', :tag => s.version }
    s.requires_arc = true
    s.source_files = 'CityDoCommon/Common/CityDoCommon.{h,m}'
    s.subspec 'Tool' do |ss|
        ss.ios.deployment_target = '9.0'
        ss.source_files = 'CityDoCommon/Common/Tool/CityDoTool.h','CityDoCommon/Common/Tool/**/**.{h,m}'
    end
    s.subspec 'Category' do |ss|
        ss.ios.deployment_target = '9.0'
        ss.source_files = 'CityDoCommon/Common/Category/CityDoCategory.h','CityDoCommon/Common/Category/**/**.{h,m}'
    end
    s.subspec 'Helper' do |ss|
    ss.ios.deployment_target = '9.0'
    ss.source_files = 'CityDoCommon/Common/Helper/CityDoHelper.h','CityDoCommon/Common/Helper/**.{h,m}'
    end
    s.subspec 'Network' do |ss|
    ss.ios.deployment_target = '9.0'
    ss.source_files = 'CityDoCommon/Common/Network/**.{h,m}'
    end
    s.dependency 'AFNetworking','~> 3.2.1'
    s.user_target_xcconfig = { 'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES' }
end
