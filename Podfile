install! 'cocoapods',
         :warn_for_unused_master_specs_repo => false

# Uncomment the next line to define a global platform for your project
platform :ios, '14.0'

target 'Asa' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  inhibit_all_warnings!

  # Pods for Asa
  
  pod 'Moya'
  pod 'SwiftyJSON'
  pod 'Closures'
  pod 'KeychainAccess'
  pod 'SwiftyUserDefaults'
  pod 'IQKeyboardManagerSwift'
  pod 'SDWebImage'
  pod 'Swinject'
  pod 'SwinjectAutoregistration'
  pod 'SwinjectStoryboard', :git => "https://github.com/Swinject/SwinjectStoryboard" , :branch => 'master'
  pod 'LanguageManager-iOS'
  pod 'SwiftLint'
  pod 'SkeletonView'
  pod 'NotificationBannerSwift'

end


pre_install do |installer|
  Pod::Installer::Xcode::TargetValidator.send(:define_method, :verify_no_static_framework_transitive_dependencies) {}
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['GCC_WARN_INHIBIT_ALL_WARNINGS'] = "YES"
            config.build_settings['SWIFT_SUPPRESS_WARNINGS'] = "YES"
            if config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'].to_f < 14.0
               config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.0'
            end
        end
    end
end
