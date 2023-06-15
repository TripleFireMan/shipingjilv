# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'
target 'shipingjilv' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  pod 'Masonry', '1.1.0'
  pod 'SDWebImage', '5.5.2'
  pod 'IQKeyboardManager', '6.4.2'                                 #键盘处理
  pod 'YYKit'
  pod 'MBProgressHUD'
  pod 'SnapKit'
  pod 'ReactiveCocoa'
  pod 'FDFullscreenPopGesture','1.1'
  pod 'FMDB'
  pod 'CYKit'
end
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
    end
  end
end
