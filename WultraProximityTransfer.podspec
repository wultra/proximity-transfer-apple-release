Pod::Spec.new do |s|
  s.name                   = "WultraProximityTransfer"
  s.version                = "0.9.9"
  s.summary                = "Bluetooth Proximity Transfer by Wultra"
  s.homepage               = "https://www.wultra.com/"
  s.author                 = { 'Wultra s.r.o.' => 'support@wultra.com' }
  s.source                 = { :git => 'https://github.com/wultra/proximity-transfer-apple-release.git', :tag => "#{s.version}" }
  s.vendored_frameworks    = "WultraProximityTransfer.xcframework"
  s.swift_version          = "5.9"
  s.ios.deployment_target  = '12.0'
  s.tvos.deployment_target = '12.0'
  s.license             = { :type => 'proprietary', :text => <<-LICENSE
    Copyright (c) 2024, Wultra s.r.o. (www.wultra.com).
    
    All rights reserved. This source code can be used only for purposes specified
    by the given license contract signed by the rightful deputy of Wultra s.r.o.
    This source code can be used only by the owner of the license.
    
    Any disputes arising in respect of this agreement (license) shall be brought
    before the Municipal Court of Prague.
  LICENSE
  }
  s.prepare_command = <<-CMD
      ./prepare.sh 0.9.9 2d3b6a26d32c7f2ebaef3fa00cfb095dcf0a1b629803ffed661518652b908902
  CMD
end