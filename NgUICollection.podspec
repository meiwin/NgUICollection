Pod::Spec.new do |spec|
  spec.name         = 'NgUICollection'
  spec.version      = '1.0'
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.homepage     = 'https://github.com/meiwin/NgUICollection'
  spec.authors      = { 'Meiwin Fu' => 'meiwin@blockthirty.com' }
  spec.summary      = "A convenience backing data structure for use with UIKit's UITableView and UICollectionView."
  spec.source       = { :git => 'https://github.com/meiwin/NgUICollection.git', :tag => 'v#{spec.version}' }
  spec.source_files = 'NgUICollection/*.{h,m}'
  spec.framework    = 'Foundation', 'UIKit'
  spec.ios.deployment_target = '5.0'
  spec.requires_arc = true
end