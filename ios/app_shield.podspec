#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint app_shield.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'app_shield'
  s.version          = '0.0.1'
  s.summary          = 'App Shield: A robust Flutter plugin for app security, featuring screenshot prevention, SSL pinning, app integrity checks, and print management for safe production.'
  s.description      = <<-DESC
A new Flutter project.
                       DESC
  s.homepage         = 'https://github.com/Xazin/app_shield'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'TD' => '42929161+Xazin@users.noreply.github.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '13.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'

  # If your plugin requires a privacy manifest, for example if it uses any
  # required reason APIs, update the PrivacyInfo.xcprivacy file to describe your
  # plugin's privacy impact, and then uncomment this line. For more information,
  # see https://developer.apple.com/documentation/bundleresources/privacy_manifest_files
  # s.resource_bundles = {'app_shield_privacy' => ['Resources/PrivacyInfo.xcprivacy']}
end
