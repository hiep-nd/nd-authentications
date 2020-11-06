//
//  NDAuthentications.h
//  NDAuthentications
//
//  Created by Nguyen Duc Hiep on 10/16/20.
//  Copyright © 2020 Nguyen Duc Hiep. All rights reserved.
//

#import <Foundation/Foundation.h>

//! Project version number for NDAuthentications.
FOUNDATION_EXPORT double NDAuthenticationsVersionNumber;

//! Project version string for NDAuthentications.
FOUNDATION_EXPORT const unsigned char NDAuthenticationsVersionString[];

#if !defined(__has_include)
#error \
    "NDAuthentications.h won't import anything if your compiler doesn't support __has_include. Please import the headers individually."
#else

#if __has_include(<NDAuthentications/Abstracts.h>)
#import <NDAuthentications/Abstracts.h>
#endif

#if __has_include(<NDAuthentications/Objects.h>)
#import <NDAuthentications/Objects.h>
#endif

#if __has_include(<NDAuthentications/Firebase.h>)
#import <NDAuthentications/Firebase.h>
#endif

#endif
