Pod::Spec.new do |s|
  s.name         = "NDAuthentications"
  s.version      = "0.1"
  s.summary      = "Support authentication UI (login, logout, profile,...)."
  s.description  = <<-DESC
  NDAuthentications is a small framework that support Support authentication UI (login, logout, profile,...).
                   DESC
  s.homepage     = "https://github.com/hiep-nd/nd-authentications.git"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Nguyen Duc Hiep" => "hiep.nd@gmail.com" }
  s.ios.deployment_target = '9.0'
#  s.tvos.deployment_target = '9.0'
  s.swift_versions = ['4.0', '5.1', '5.2']
  s.requires_arc   = true
  #s.source        = { :http => 'file:' + URI.escape(__dir__) + '/' }
  s.source       = { :git => "https://github.com/hiep-nd/nd-authentications.git", :tag => "Pod-#{s.version}" }
#  s.source_files  = "Sources/*.{h,m,mm,swift}"
  #s.public_header_files = 'Sources/NDAuthentications/**/*.h'
  #s.private_header_files = 'Sources/**/Privates/**/*.h'
  #s.header_mappings_dir = 'Sources/NDAuthentications/'
  
  s.subspec 'Core' do |ss|
    ss.source_files = "Sources/Core/*.{h,m,mm,swift}"
  end
    
  s.subspec 'Abstracts' do |ss|
    ss.source_files = "Sources/Abstracts/*.{h,m,mm,swift}"
    ss.framework = 'Foundation'
    ss.dependency 'NDAuthentications/Core'
    ss.dependency 'NDMVVM', '~> 0.0.3'
  end
  
  s.subspec 'Resources' do |ss|
    ss.resource_bundle = { "NDAuthentications" => [ "Sources/Resources/*.lproj/*.strings" ] }
  end
  
  s.subspec 'Objects' do |ss|
    ss.source_files = "Sources/Objects/*.{h,m,mm,swift}"
    ss.framework = 'Foundation', 'UIKit'
    ss.dependency 'NDAuthentications/Abstracts'
    ss.dependency 'NDAuthentications/Resources'
    ss.dependency 'NDAutolayoutUtils', '~> 0.0.6'
    ss.dependency 'NDLog', '~> 0.0.5'
    ss.dependency 'NDUtils/libextobjc', '~> 0.0.4.4'
    ss.dependency 'NDUtils/objc', '~> 0.0.4.4'
    ss.dependency 'NDUtils/Foundation', '~> 0.0.4.4'
    ss.dependency 'NDUtils/UIKit', '~> 0.0.4.4'
  end
  
  s.subspec 'Firebase' do |ss|
    ss.source_files = "Sources/Firebase/*.{h,m,mm,swift}"
    ss.framework = 'Foundation'
    ss.dependency 'FirebaseAuth', '~> 7'
    ss.dependency 'NDAuthentications/Objects'
  end
  
  s.subspec 'Firebase_Swift' do |ss|
    ss.source_files = "Sources/Firebase_Swift/*.{h,m,mm,swift}"
    ss.dependency 'NDAuthentications/Firebase'
  end
  
  s.default_subspec = 'Core', 'Abstracts',  'Firebase', 'Objects', 'Resources'
  
  s.subspec 'Swift' do |ss|
    ss.dependency 'NDAuthentications/Firebase_Swift'
  end
end
