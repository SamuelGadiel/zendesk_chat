#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint zendesk.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'zendesk_helper_plus'
  s.version          = '0.0.1'
  s.license          = { :file => '../LICENSE' }
  s.source           = { :path => '.' }
  s.authors          = { 'Muljin LTD' => 'omar250abdo@gmail.com',
                         'agnkuz' => 'agnieszka.kuzniecow@appunite.com',
                         'Daanilo-s19' => 'danilodelete@hotmail.com',
                         'josecleiton' => 'jcleitonbc@gmail.com',
                         'teuaguiar01' => 'matheus.aguiar@aarin.com.br',
                         'Samuel Gadiel' => 'samuelgadiel@gmail.com' }
  s.homepage         = 'github.com/SamuelGadiel'
  s.summary          = 'Flutter plugin for Zendesk Chat SDK v3'
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'ZendeskChatSDK'
  s.platform = :ios, '12.0'
  s.static_framework = true

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'

end
