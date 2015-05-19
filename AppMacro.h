//
//  AppMacro.h
//  iTuCao
//
//  Created by NiYao on 15/5/11.
//  Copyright (c) 2015年 NiYao. All rights reserved.
//

#ifndef iTuCao_AppMacro_h
#define iTuCao_AppMacro_h

#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define DEVICE_SCALE [[UIScreen mainScreen] bounds].size.height/[[UIScreen mainScreen] bounds].size.width
#define DEVICE_SCALE_W_H [[UIScreen mainScreen] bounds].size.width/[[UIScreen mainScreen] bounds].size.height

#define STATUSBAR_WIDTH [[UIApplication sharedApplication] statusBarFrame].size.width
#define STATUSBAR_HEIGHT [[UIApplication sharedApplication] statusBarFrame].size.height

#define APP_NAME @"i吐槽"
#define LEFT_MENU_WIDTH 260
#define LEFT_MENU_MARGIN 65
#define RIGHT_MENU_WIDTH 220
#define MIDDLE_NAVBAR_HEIGHT 60
#define DARKBLUE [UIColor colorWithRed:31.0/255.0 green:66.0/255.0 blue:96.0/255.0 alpha:1.0]

#define TUCAO_NAME_FONT [UIFont systemFontOfSize:15]
#define TUCAO_CONTENT_FONT [UIFont systemFontOfSize:16]
#define TUCAO_TITLE_FONT  [UIFont boldSystemFontOfSize:17]
#define TUCAO_PADDING 10
#define TUCAO_AVATAR_WIDTH 45
#define TUCAO_AVATAR_HEIGHT 45

#endif
