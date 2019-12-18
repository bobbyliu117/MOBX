Pod::Spec.new do |s|
  s.name             = 'MOBX'
  s.version          = '0.0.1'
  s.summary          = 'Chang creates this pod to ease his dev life.'

  s.description      = <<-DESC
Already included utils are:
1) ViewUtils;
Utils to be implemented are:
1) NetworkUtils;
2) DataUtils;
                       DESC

  s.homepage         = 'https://github.com/bobbyliu117/MOBX'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'bobbyliu117' => 'bobbyliu117@gmail.com' }
  s.source           = { :git => 'https://github.com/bobbyliu117/MOBX.git', :tag => s.version.to_s }

  s.ios.deployment_target = '12.0'
  s.source_files = 'MOBX/**/*.{h,m,swift}'
end
